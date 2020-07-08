local nvim_lsp = require'nvim_lsp'
local on_attach_vim = function()
    require'completion'.on_attach()
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
    cmd = { "/Users/gregor/.pyenv/versions/3.8.3/bin/pyls" }
}

nvim_lsp.vimls.setup{
    on_attach = on_attach_vim 
}

require'completion'.addCompletionSource('nvimr', require'nvimr'.complete_item)
require'completion'.addCompletionSource('vimpandoc', require'vimpandoc'.complete_item)
