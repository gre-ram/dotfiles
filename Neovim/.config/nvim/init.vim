set nocompatible
set encoding=utf-8
set shell=/bin/zsh
let maplocalleader = ','
let mapleader =','
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'jalvesaq/Nvim-R'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-airline/vim-airline'
Plug '/usr/local/opt/fzf'
Plug '~/.fzf'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula
let g:dracula_bold = 1
let g:dracula_italic = 1
let g:dracula_underline = 1
let g:dracula_undercurl = 1
let g:dracula_inverse = 1
let g:dracula_colorterm = 1
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE
syntax on
set spelllang=de,en 
set nobackup
set noswapfile
set clipboard=unnamed
set history=100
set ruler
set showcmd
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

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
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
let g:UltiSnipsSnippetDirectories=[$HOME.'/.ultisnips/ultisnips']


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

let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
