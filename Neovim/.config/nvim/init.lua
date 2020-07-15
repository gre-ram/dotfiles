local chain_complete_list = {
    default = {
        default = {
            {complete_items = {'lsp', 'snippet'}},
            {complete_items = {'path'}, triggered_only = {'/'}},
            {complete_items = {'buffers'}},
        },
        string = {
            {complete_items = {'path'}, triggered_only = {'/'}},
        },
    },
    md = {
        default = {
            {complete_items = {'path'}, triggered_only = {'/'}},
            {complete_items = {'vimpandoc'}, triggered_only = {'@'}},
            {complete_items = {'buffers'}}
        }
    }
}


local nvim_lsp = require'nvim_lsp'
On_attach_vim = function()
    require'completion'.on_attach({
        chain_complete_list = chain_complete_list
    })
    require'diagnostic'.on_attach()
end

require'completion'.addCompletionSource('vimpandoc', require'vimpandoc'.complete_item)

nvim_lsp.r_language_server.setup{
<<<<<<< HEAD
    on_attach = on_attach_vim
=======
    on_attach = On_attach_vim
>>>>>>> dev
}

nvim_lsp.texlab.setup{
    on_attach = On_attach_vim;
    filetypes = { "plaintex", "tex", "bib" }
}

nvim_lsp.pyls.setup{
    on_attach = On_attach_vim,
    cmd = { "/Users/gregor/.pyenv/versions/3.8.3/bin/pyls" }
}

nvim_lsp.vimls.setup{
<<<<<<< HEAD
    on_attach = on_attach_vim
}

nvim_lsp.sumneko_lua.setup{
    on_attach = on_attach_vim,
=======
    on_attach = On_attach_vim
}

nvim_lsp.sumneko_lua.setup{
    on_attach = On_attach_vim,
>>>>>>> dev
    cmd = {"/Users/gregor/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/macOS/lua-language-server", "-E", "/Users/gregor/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua"};
}

