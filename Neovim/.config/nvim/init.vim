let maplocalleader = ','
let g:mapleader ="\<Space>"
"
" do something like this:
" $ pyenv install 3.5.2
" $ pyenv virtualenv 3.5.2 neovim3
if glob('~/.pyenv/versions/neovim3/bin/python') != ''
    let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')
else
    let g:python3_host_prog = systemlist('which python3')[0]
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins (to get all helpfiles exec :helptags ALL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! vim-fugitive
packadd! vim-gitgutter
packadd! nvim-r
packadd! table-mode
packadd! vim-pandoc-syntax
packadd! vim-pandoc
packadd! plenary.nvim
packadd! popup.nvim
packadd! telescope.nvim
packadd! nvim-treesitter
"packadd! maybe using for snippets in future: snippets.nvim
packadd! vim-surround
packadd! nvim-lspconfig
packadd! lsp-status.nvim
packadd! nvim-web-devicons
packadd! completion-nvim
packadd! completion-buffers
packadd! completion-treesitter
packadd! bib-exzerpt.nvim 
packadd! vim-devicons
packadd! nvim-colorizer.lua
packadd! auto-pairs
packadd! playground
packadd! colorbuddy.nvim
packadd! LanguageTool.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set shell=/usr/local/bin/zsh
syntax on
lua require('colorbuddy').colorscheme('color')
set listchars=tab:»\ ,eol:↲
set list
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
set nonumber
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
lua require'colorizer'.setup()

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Search", timeout=300}
augroup END

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


map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Zettelkasten Wiki with Pandoc Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spellsuggest=fast

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
    let string = "Corpus " . key
    execute string
endfun

function! OpenCiteKeyPDF() abort
    let key = GetCiteKeyUnderCursor()
    let string = "silent ! open " . g:zettel_pdf_dict . "/" . l:key . ".pdf"
    execute string
endfun

nnoremap <silent> <leader>cn :call OpenCiteKeyNote() <CR>
nnoremap <silent> <leader>cb :call OpenCiteKeyInBib() <CR>
nnoremap <silent> <leader>cp :call OpenCiteKeyPDF() <CR>
nnoremap <Leader>en <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>



let g:pandoc#completion#bib#mode = "fallback"
let g:pandoc#biblio#sources = "g"
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#biblio#bibs = [$HOME.'/Documents/myBib/main.bib']
let g:pandoc#completion#bib#use_preview = 1
let g:pandoc#modules#disabled = ["folding"]

let g:languagetool_server_jar = expand('/usr/local/Cellar/languagetool/*/libexec/languagetool-server.jar')
autocmd Filetype pandoc LanguageToolSetUp

function! ToPDF() abort
   let string = "!pandoc --pdf-engine=xelatex --citeproc --csl ~/.pandoc/apa.csl --lua-filter ~/.pandoc/apa_und.lua --bibliography ~/Documents/myBib/main.bib -i " . expand('%:p') . " -o " . expand('%:p:r') . ".pdf && open " . expand('%:p:r') . ".pdf"
   silent execute string
endfun

function! ToWord() abort
   let string = "!pandoc --citeproc --csl ~/.pandoc/apa.csl --lua-filter ~/.pandoc/apa_und.lua --bibliography ~/Documents/myBib/main.bib -i " . expand('%:p') . " -o " . expand('%:p:r') . ".docx && open " . expand('%:p:r') . ".docx"
   silent execute string
endfun
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => R IDE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let R_hl_term = 0 "R Output is colored by
let R_hi_fun_globenv = 2
let R_csv_app = "terminal: vd"

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
lua require 'configoflsp'
set completeopt=menuone,noinsert,noselect
set shortmess+=c

autocmd BufEnter * lua require'completion'.on_attach()

sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=ﬤ texthl=LspDiagnosticsSignHint linehl= numhl=

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
imap  <c-j> <Plug>(completion_next_source)
imap  <c-k> <Plug>(completion_prev_source)

let g:completion_chain_complete_list = {
    \ 'pandoc': [
    \       {'complete_items': ['path'], 'triggered_only': ['/']},
    \       {'mode': 'omni'},
    \       {'complete_items': ['snippet']},
    \       {'complete_items': ['buffers']},
    \],
    \ 'default': [
    \       {'complete_items': ['path'], 'triggered_only': ['/']},
    \       {'complete_items': ['lsp', 'snippet']},
    \       {'complete_items': ['buffers']},
    \]
    \}

let g:completion_matching_ignore_case = 1
let g:completion_enable_auto_paren = 1
let g:completion_auto_change_source = 1
