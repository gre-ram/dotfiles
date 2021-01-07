local vim = vim
local devicons = require'nvim-web-devicons'
local Job = require('plenary.job')
local blank = ' '


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


local function git_changes()
  local buffer =  string.format(vim.api.nvim_get_current_buf())
  local wd = vim.api.nvim_buf_get_name(buffer)
  local j = Job:new({
    command = "git",
    args = {"status", "--short"},
    cwd = vim.fn.fnamemodify(wd, ":h"),
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


local function get_git_remote()
  local buffer =  string.format(vim.api.nvim_get_current_buf())
  local wd = vim.api.nvim_buf_get_name(buffer)
  local j = Job:new({
    command = "git",
    args = {"config", "--get", "remote.origin.url"},
    cwd = vim.fn.fnamemodify(wd, ":h"),
  })

  local ok, result = pcall(function()
    return vim.trim(j:sync()[1])
  end)

  if ok then
    return result
  end
end


local function get_git_branch()
  local buffer =  string.format(vim.api.nvim_get_current_buf())
  local wd = vim.api.nvim_buf_get_name(buffer)
  local j = Job:new({
    command = "git",
    args = {"branch", "--show-current"},
    cwd = vim.fn.fnamemodify(wd, ":h"),
  })

  local ok, result = pcall(function()
    return vim.trim(j:sync()[1])
  end)

  if ok then
    return result
  end
end

local function git_part()
    local branch = get_git_branch()
    if branch == nil then
        return ""
    else
        local remote = get_git_remote()
        if remote == nil then
            local dot = git_changes()
            local string = "[ "..branch..dot.."]"
            return string
        else
            local dot = git_changes()
            local string = "[ "..branch..dot.."]"
            return string
        end
    end
end

local git_string = string.format(git_part())
local function statuslinee(active)
    local icon = file_icon(active)
    if not active then
        local line = "%#StatusLineNC#"..blank..icon.."%f"
        return line
    else
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
