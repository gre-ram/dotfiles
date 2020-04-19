set nocompatible
set encoding=utf-8
set shell=/bin/zsh
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Installation von Vim-Plug fals notwendig
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" plugins mit vim-plug

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-airline/vim-airline'
Plug '/usr/local/opt/fzf'
Plug '~/.fzf'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme dracula

syntax on

set spelllang=de,en 
" Use vim, not vi api
" No backup files
set nobackup

" No swap file
set noswapfile

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
" set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Turn on line numbers
set number
set relativenumber
set rnu
" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

set laststatus=2

set mouse=a



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command -nargs=*  GetBib  r ! ~/.scripts/getbib.zsh <args>

let g:pandoc#completion#bib#mode = "citeproc"
let g:pandoc#biblio#sources = "g"
let g:pandoc#filetypes#handled = ["pandoc", "markdown", "textile"]
let g:pandoc#biblio#bibs = ["/Users/gregor/main.bib"]
let g:pandoc#completion#bib#use_preview = 1
let g:pandoc#folding#fdc = 0
let g:pandoc#folding#level = 999

