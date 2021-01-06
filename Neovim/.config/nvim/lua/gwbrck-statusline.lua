local vim = vim
local devicons = require'nvim-web-devicons'
local Job = require('plenary.job')
local blank = ' '


local function file_icon()
    local f_name,f_extension = vim.fn.expand('%:t'),vim.fn.expand('%:e')
    local icon, icon_highlight = devicons.get_icon(f_name,f_extension, { default = true })
    local fg_color = vim.api.nvim_eval("synIDattr(synIDtrans(hlID('" .. icon_highlight .. "')), 'fg', 'gui')")
    local bg_color = vim.api.nvim_eval("synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui')")
    vim.cmd('hi! CurrFile guibg=' .. bg_color .. ' guifg=' .. fg_color)
    return '%#CurrFile#' .. icon .. '%#StatusLine#' .. blank
end


local function git_branch()
  local buffer =  string.format(vim.api.nvim_get_current_buf())
  local j = Job:new({
    command = "git",
    args = {"branch", "--show-current"},
    cwd = vim.fn.fnamemodify(buffer.name, ":h"),
  })

  local ok, result = pcall(function()
    return vim.trim(j:sync()[1])
  end)

  if ok then
    return result
  end
end


local function statuslinee()
    local branch = git_branch()
    local icon = file_icon()
    local test = blank..icon.."%f"..blank..branch
    return test
end

local function exec_autocommands()
    _G.statuslinee = statuslinee
    vim.cmd([[autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.statuslinee()]])
--  vim.cmd([[autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.statusline(1)]])
--  vim.cmd([[autocmd WinLeave,BufLeave * setlocal statusline=%!v:lua.statusline()]])
end

exec_autocommands()

