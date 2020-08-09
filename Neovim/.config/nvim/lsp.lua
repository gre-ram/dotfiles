local chain_complete_list = {
  default = {
    default = {
      {complete_items = {'lsp', 'snippet'}},
      {complete_items = {'path'}, triggered_only = {'/'}},
    },
    string = {
      {complete_items = {'path'}, triggered_only = {'/'}},
    },
    comment = {},
  }
}

local lsp = require'nvim_lsp'
local on_attach_vim = function()
    require'diagnostic'.on_attach()
    require'completion'.on_attach({
    sorting = 'alphabet',
    matching_strategy_list = {'exact', 'fuzzy'},
    chain_complete_list = chain_complete_list,
    })

    local mapper = function(mode, key, result)
        vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap=true, silent=true})
    end

    mapper('n', 'ff', '<cmd> lua vim.lsp.buf.formatting() <CR>')
    mapper('n', '<Leader><TAB>', '<cmd> NextDiagnosticCycle <CR>')
    mapper('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    mapper('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
    mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    mapper('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    mapper('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    mapper('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
end

lsp.r_language_server.setup{
    on_attach = on_attach_vim
}

lsp.texlab.setup{
    on_attach = on_attach_vim;
    filetypes = { "plaintex", "tex", "bib" }
}

lsp.pyls.setup{
    on_attach = on_attach_vim
}

lsp.vimls.setup{
    on_attach = on_attach_vim
}

lsp.bashls.setup{
    on_attach = on_attach_vim
}

lsp.sumneko_lua.setup{
    on_attach = on_attach_vim,
    cmd = {"/Users/gregor/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/macOS/lua-language-server", "-E", "/Users/gregor/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua"};
}
