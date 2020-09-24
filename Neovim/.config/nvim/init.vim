set nocompatible
set encoding=utf-8
set shell=/usr/local/bin/zsh
let maplocalleader = ','
let g:mapleader ="\<Space>"
let g:python3_host_prog = expand('$PYENV_ROOT/versions/Neovim/bin/python') 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins (to get all helpfiles exec :helptags ALL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! vim-fugitive
packadd! vim-gitgutter
packadd! nvim-r
packadd! ultisnips
set rtp+=/usr/local/opt/fzf
packadd! fzf.vim
packadd! table-mode
packadd! nord-vim
"packadd! dracula
packadd! vim-pandoc
packadd! notational-fzf-vim
packadd! vim-pandoc-syntax
packadd! vim-addon-mw-utils
packadd! tlib_vim
packadd! vim-surround
packadd! nvim-lspconfig
packadd! completion-nvim
packadd! diagnostic-nvim
packadd! completion-buffers
packadd! vim-devicons
packadd! auto-pairs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
colorscheme nord
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
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function FixLastSpellError()
    normal! mm[s1z=`m
endfun

nnoremap <leader>bn <cmd> bnext <CR>
nnoremap <leader>bp <cmd> bprevious <CR>
nnoremap <leader>bd <cmd> bd <CR>
nnoremap <leader>sf :source %<cr>
nnoremap <leader>sp :call FixLastSpellError() <cr>  


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Zettelkasten Wiki with Pandoc Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

let g:nv_search_paths = ['~/Documents/myBib/notes']
let g:zettel_pdf_dict = '~/Documents/myBib/pdfs'
let g:zettel_bib_file = '~/Documents/myBib/main.bib'

function! GetCiteKeyUnderCursor() abort
    let line = getline('.')
    let key = matchstr(line,
                \ '\%<'.(col('.')+1).'c'.
                \ '\(@\)\zs[^,\];[:space:]]\+'.
                \ '\%>'.col('.').'c')
    return key
endfun

function! OpenCiteKeyInBib() abort
    let key = GetCiteKeyUnderCursor()
    let string = "e " . g:zettel_bib_file . " | /" . l:key
    execute string
endfun

function! OpenCiteKeyNote() abort 
    let key = GetCiteKeyUnderCursor()
    let string = "NV " . key
    execute string
endfun

function! OpenCiteKeyPDF() abort
    let key = GetCiteKeyUnderCursor()
    let string = "silent ! open " . g:zettel_pdf_dict . "/" . l:key . ".pdf"
    execute string
endfun

let g:pandoc#completion#bib#mode = "citeproc"
let g:pandoc#biblio#sources = "g"
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#biblio#bibs = [$HOME.'/Documents/myBib/main.bib']

nnoremap <silent> <leader>cn :call OpenCiteKeyNote() <CR>
nnoremap <silent> <leader>cb :call OpenCiteKeyInBib() <CR>
nnoremap <silent> <leader>cp :call OpenCiteKeyPDF() <CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => R IDE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let R_hl_term = 0 "R Output is colored by
let R_hi_fun_globenv = 2
let R_csv_app = 'tmux new-window vd'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
set statusline+=\ \ %f
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Linting & Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
luafile ~/.config/nvim/lsp.lua
lua require'completion'.addCompletionSource('vimpandoc', require'vimpandoc'.complete_item)
set completeopt=menuone,noinsert,noselect
set shortmess+=c

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <tab> <Plug>(completion_smart_tab)
nmap <s-tab> <Plug>(completion_smart_s_tab)
imap  <c-j> <Plug>(completion_next_source)
imap  <c-k> <Plug>(completion_prev_source)

let g:UltiSnipsExpandTrigger		= "<Plug>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsSnippetDirectories=[$HOME.'/.ultisnips/ultisnips']
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_auto_hover = 1
let g:completion_max_items = 10
let g:completion_enable_auto_paren = 0
let g:completion_timer_cycle = 80
let g:completion_auto_change_source = 0
let g:completion_matching_ignore_case = 1

let g:completion_chain_complete_list = {
    \ 'default' : {
    \   'default': [
    \       {'complete_items': ['snippet', 'buffers']},
    \],
    \   'comment': [{'complete_items': ['path'], 'triggered_only': ['/']}]
    \   },
    \ 'markdown.pandoc': {
    \   'default': [
    \       {'complete_items': ['snippet']},
    \       {'complete_items': ['vimpandoc']}
    \]
    \   }
    \}

augroup CompletionStartUp
    autocmd!
    autocmd BufEnter *.md lua require'completion'.on_attach()
augroup end
