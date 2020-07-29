local pyenv_root = os.getenv("PYENV_ROOT")
local pyenv_global = os.getenv("pyenv_global")
local nvim_lsp = require'nvim_lsp'
local on_attach_vim = function()
    require'diagnostic'.on_attach()
end

nvim_lsp.r_language_server.setup{
    on_attach = on_attach_vim
}

nvim_lsp.texlab.setup{
    on_attach = on_attach_vim;
    filetypes = { "plaintex", "tex", "bib" }
}

nvim_lsp.pyls.setup{
    on_attach = on_attach_vim,
    cmd = { pyenv_root .. "/versions/" .. pyenv_global .. "/bin/pyls" }
}

nvim_lsp.vimls.setup{
    on_attach = on_attach_vim
}

nvim_lsp.sumneko_lua.setup{
    on_attach = on_attach_vim
}

nvim_lsp.sumneko_lua.setup{
    on_attach = on_attach_vim,
    cmd = {"/Users/gregor/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/macOS/lua-language-server", "-E", "/Users/gregor/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua"};
}
