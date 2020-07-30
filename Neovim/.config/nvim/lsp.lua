local global_bin_pypath = os.getenv("global_bin_pypath")
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
    cmd = {global_bin_pypath .. "pyls"}
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
