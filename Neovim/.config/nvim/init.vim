set nocompatible
set encoding=utf-8
set shell=/bin/zsh
let maplocalleader = ','
let mapleader =','
let g:python3_host_prog = '/Users/gregor/.pyenv/versions/3.8.2/envs/Neovim3/bin/python'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! vim-fugitive

set rtp+=/usr/local/opt/fzf

packadd! deoplete.nvim
let g:deoplete#enable_at_startup = 1

call plug#begin('~/.vim/plugged')
Plug 'jalvesaq/Nvim-R'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()
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
set shortmess+=c
set signcolumn=yes


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pandoc und Citation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command -nargs=*  GetBib  r ! ~/.scripts/getbib.zsh <args>

let g:pandoc#completion#bib#mode = "citeproc"
let g:pandoc#biblio#sources = "g"
let g:pandoc#filetypes#handled = ["pandoc", "markdown", "textile"]
let g:pandoc#biblio#bibs = [$HOME.'/main.bib']
let g:pandoc#completion#bib#use_preview = 1
let g:pandoc#folding#fdc = 0
let g:pandoc#folding#level = 999


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => R IDE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let R_hl_term = 1 "R Output is colored by
let R_args = ['--quiet']
let R_csv_app = 'tmux new-window vd'
let R_term_cmd = 'tmux new-window R' "not on mac
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * setlocal norelativenumber

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
    \ 'n'  : 'Normal ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'Visual ',
    \ 'V'  : 'V·Line ',
    \ '' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '' : 'S·Block ',
    \ 'i'  : 'Insert ',
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
set statusline+=\ %p%%
set statusline+=\ %l:%c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Linting and Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call deoplete#custom#var('omni', 'input_patterns', {
    \ 'pandoc': '@'
    \})


let g:UltiSnipsExpandTrigger='<Plug>(ultisnips_expand)'
set completeopt=noinsert,menuone,noselect,preview
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsSnippetDirectories=[$HOME.'/.ultisnips/ultisnips']


inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

