set nocompatible
set encoding=utf-8
set shell=/usr/local/bin/zsh
let maplocalleader = ','
let g:mapleader ="\<Space>"
let g:python3_host_prog = expand('$PYENV_ROOT/shims/python')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins (to get all helpfiles exec :helptags ALL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! vim-fugitive
packadd! vim-gitgutter
set rtp+=/usr/local/opt/fzf
packadd! Nvim-R
packadd! UltiSnips
packadd! table-mode
packadd! dracula
packadd! vim-pandoc-syntax
packadd! vim-addon-mw-utils
packadd! tlib_vim
packadd! vim-surround
"packadd! vim-slime
packadd! nvim-lsp
packadd! completion-nvim
packadd! diagnostic-nvim
packadd! vim-devicons

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
colorscheme dracula
let g:dracula_bold = 1
let g:dracula_italic = 1
let g:dracula_underline = 1
let g:dracula_undercurl = 1
let g:dracula_inverse = 1
let g:dracula_colorterm = 1
hi LineNr ctermbg=NONE guibg=NONE
syntax on
set spelllang=de,en
set nobackup
set noswapfile
set clipboard=unnamed
set history=100
set ruler
set showcmd
set noshowmode
set incsearch
set hlsearch
set smartcase
set ignorecase
set hidden
set nowrap
set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4
set number
set relativenumber
set rnu
set timeout timeoutlen=1000 ttimeoutlen=100
set laststatus=2
set mouse=a
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * setlocal norelativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pandoc und Citation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command -nargs=*  GetBib  r ! ~/.scripts/getbib.zsh <args>

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=pandoc
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => R IDE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let R_hl_term = 0 "R Output is colored by
let R_hi_fun_globenv = 2
let R_csv_app = 'tmux new-window $PYENV_ROOT/shims/vd'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Airline and Movingarround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>b :buffers<cr>:b<space>
nnoremap <leader>gt :bn<cr>
nnoremap <leader>gT :bp<cr>
nnoremap <leader>q :bd<cr>

function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    let fugiline = FugitiveHead()
    if (fugiline != '')
        return printf(' %s:  %d ~ %d  %d',fugiline, a, m, r)
    else
        return printf('')
    endif
endfunction

let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'V·Line ',
    \ '' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '' : 'S·Block ',
    \ 'i'  : 'I ',
    \ 'R'  : 'Replace ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '
    \}

function! ChangeStatuslineColor()
     if (mode() =~# '\v(n|no)')
       exe 'hi! link currentStatusLine StatusLine'
     elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
       exe 'hi! link currentStatusLine DiffChange'
     elseif (mode() ==# 'i')
       exe 'hi! link currentStatusLine DiffAdd'
     else
       exe 'hi! link currentStatusLine StatusLine'
     endif
     return ''
 endfunction


set statusline=
set statusline+=%{ChangeStatuslineColor()}
set statusline+=%#currentStatusLine#
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%#tabline#
set statusline+=\  
set statusline+=\ %f
set statusline+=%m
set statusline+=\ %{GitStatus()}
set statusline+=%=
set statusline+=%#currentStatusLine#
set statusline+=\ %Y
set statusline+=\ %{WebDevIconsGetFileTypeSymbol()} 
set statusline+=\ [\ %p%%
set statusline+=\ ﮆ
set statusline+=\ %l
set statusline+=\ ﮇ
set statusline+=\ %c\ ]
set statusline+=\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menuone,noinsert,noselect
set shortmess+=c

let g:UltiSnipsExpandTrigger		= "<c-o>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsSnippetDirectories=[$HOME.'/.ultisnips/ultisnips']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Linting & Completion not usable yet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

let g:completion_enable_snippet = 'UltiSnips'


lua << EOF
    local nvim_lsp = require'nvim_lsp'
    local on_attach_vim = function()
        require'completion'.on_attach()
        require'diagnostic'.on_attach()
    end

    nvim_lsp.r_language_server.setup{
       on_attach = on_attach_vim 
    }

    nvim_lsp.pyls.setup{
        on_attach = on_attach_vim  
    }
    nvim_lsp.vimls.setup{
        on_attach = on_attach_vim 
    }
EOF

" lua require'completion'.addCompletionSource('nvimr', require'nvimr'.complete_item)
" lua require'completion'.addCompletionSource('vim-pandoc', require'vim-pandoc'.complete_item)

"let g:completion_chain_complete_list = {
"    \ 'r': [
"    \    {'complete_items': ['nvimr', 'snippet', 'lsp']},
"    \    {'mode': '<c-p>'}
"    \],
"    \ 'pandoc': [
"    \    {'complete_items': ['vim-pandoc', 'snippet']},
"    \    {'mode': '<c-p>'},
"    \    {'mode': '<c-n>'}
"    \],
"    \ 'default': [
"    \    {'complete_items': ['lsp', 'snippet']},
"    \    {'mode': '<c-p>'},
"    \    {'mode': '<c-n>'}
"    \]
"\}

nnoremap <silent> <Leader><TAB> <cmd> NextDiagnosticCycle <CR>
nnoremap <silent> gd            <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]>         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD            <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>         <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD           <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr            <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0            <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW            <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

