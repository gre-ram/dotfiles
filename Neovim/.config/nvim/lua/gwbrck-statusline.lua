local vim = vim
local devicons = require'nvim-web-devicons'
local Job = require('plenary.job')
local curr_files = {}
local blank = ' '
local purple = '#B48EAD'
local blue = '#81A1C1'
local yellow = '#EBCB8B'
local green = '#A3BE8C'
local red = '#BF616A'
local white_fg = '#e6e6e6'
local black_fg = '#282c34'
local bg = '#4d4d4d'


-- Mode Prompt Table
local current_mode = setmetatable({
      ['n'] = 'NORMAL',
      ['no'] = 'N·Operator Pending',
      ['v'] = 'VISUAL',
      ['V'] = 'V·Line',
      ['^V'] = 'V·Block',
      ['s'] = 'Select',
      ['S'] = 'S·Line',
      ['^S'] = 'S·Block',
      ['i'] = 'INSERT',
      ['ic'] = 'INSERT',
      ['ix'] = 'INSERT',
      ['R'] = 'Replace',
      ['Rv'] = 'V·Replace',
      ['c'] = 'COMMAND',
      ['cv'] = 'Vim Ex',
      ['ce'] = 'Ex',
      ['r'] = 'Prompt',
      ['rm'] = 'More',
      ['r?'] = 'Confirm',
      ['!'] = 'Shell',
      ['t'] = 'TERMINAL'
    }, {
      -- fix weird issues
      __index = function(_, _)
        return 'V·Block'
      end
    }
)

local RedrawColors = function(mode)
  if mode == 'n' then
    vim.api.nvim_command('hi Mode guibg='..green..' guifg='..black_fg..' gui=bold')
    vim.api.nvim_command('hi ModeSeparator guifg='..green)
  end
  if mode == 'i' then
    vim.api.nvim_command('hi Mode guibg='..blue..' guifg='..black_fg..' gui=bold')
    vim.api.nvim_command('hi ModeSeparator guifg='..blue)
  end
  if mode == 'v' or mode == 'V' or mode == '^V' then
    vim.api.nvim_command('hi Mode guibg='..purple..' guifg='..black_fg..' gui=bold')
    vim.api.nvim_command('hi ModeSeparator guifg='..purple)
  end
  if mode == 'c' then
    vim.api.nvim_command('hi Mode guibg='..yellow..' guifg='..black_fg..' gui=bold')
    vim.api.nvim_command('hi ModeSeparator guifg='..yellow)
  end
  if mode == 't' then
    vim.api.nvim_command('hi Mode guibg='..red..' guifg='..black_fg..' gui=bold')
    vim.api.nvim_command('hi ModeSeparator guifg='..red)
  end
end

local function file_icon(active)
    local f_name,f_extension = vim.fn.expand('%:t'),vim.fn.expand('%:e')
    local icon, icon_highlight = devicons.get_icon(f_name,f_extension, { default = true })
    if not active then
        return icon .. blank
    else
        local fg_color = vim.api.nvim_eval("synIDattr(synIDtrans(hlID('" .. icon_highlight .. "')), 'fg', 'gui')")
        local bg_color = vim.api.nvim_eval("synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui')")
        vim.cmd('hi! CurrFile guibg=' .. bg_color .. ' guifg=' .. fg_color)
        return '%#CurrFile#' .. icon .. '%#StatusLine#' .. blank
    end
end


local function git_changes(fp)
  local j = Job:new({
    command = "git",
    args = {"status", "--short"},
    cwd = vim.fn.fnamemodify(fp, ":h"),
  })

  local ok, _ = pcall(function()
    return vim.trim(j:sync()[1])
  end)

  if ok then
    return "~"
  else
    return ""
  end
end


local function get_git_remote(fp)
  local j = Job:new({
    command = "git",
    args = {"config", "--get", "remote.origin.url"},
    cwd = vim.fn.fnamemodify(fp, ":h"),
  })

  local ok, result = pcall(function()
    return vim.trim(j:sync()[1])
  end)

  if ok then
    return result
  end
end


local function get_git_branch(fp)
  local j = Job:new({
    command = "git",
    args = {"branch", "--show-current"},
    cwd = vim.fn.fnamemodify(fp, ":h"),
  })

  local ok, result = pcall(function()
    return vim.trim(j:sync()[1])
  end)

  if ok then
    return result
  else
    return false
  end
end

local function git_part(fp)
    local branch = get_git_branch(fp)
    if branch == false then
        return false
    else
        local remote = get_git_remote(fp)
        if remote == nil then
            local dot = git_changes(fp)
            local string = "[ "..branch..dot.."]"
            return string
        else
            local dot = git_changes(fp)
            local string = "[ "..branch..dot.."]"
            return string
        end
    end
end

local function check_for_new_string(fp)
    if curr_files[fp] ~= nil then
        if curr_files[fp] == false then
            return ""
        else
            return curr_files[fp]
        end
    else
        local new_string = git_part(fp)
        curr_files[fp] = new_string
        if new_string == false then
            return ""
        else
            return new_string
        end
    end
end

local function statuslinee(active)
    local icon = file_icon(active)
    if not active then
        local line = "%#StatusLineNC#"..blank..icon.."%f"
        return line
    else
        local fp = vim.api.nvim_buf_get_name(string.format(vim.api.nvim_get_current_buf()))
        local git_string = string.format(check_for_new_string(fp))
        local test = blank..icon.."%f"..blank..git_string
        return test
    end
end

local function exec_autocommands()
    _G.statuslinee = statuslinee
    vim.cmd([[autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.statuslinee(1)]])
    vim.cmd([[autocmd WinLeave,BufLeave * setlocal statusline=%!v:lua.statuslinee()]])
end
exec_autocommands()
