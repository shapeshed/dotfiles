" welcome to the future
set nocompatible

" enable syntax highlighting
syntax on

" allow plugins to determine indentation
filetype plugin indent on 

" set leader to ,
let mapleader = ","

" disable_banner in filebrowser
let g:netrw_banner = 0

" use solarized dark color scheme
color solarized
set background=dark

" faster editing and sourcing of `.vimrc`
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Alias for saving when not editing as sudo
cmap w!! %!sudo tee > /dev/null %

" Lightweight ruler using ruler rather than statusbar
set laststatus=0
set ruler
set rulerformat=%80(%=B:%n\ %f%m\ %y\ %{&fileencoding?&fileencoding:&encoding}\[%{&fileformat}\]\ %p%%\ \ %l:%c%)

if has("autocmd")
  " Open files in last saved position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  autocmd BufRead,BufNewFile *.go set noet ts=4 sw=4
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd FileType help wincmd L
endif

set encoding=utf-8
set number                      
set showmatch                   
set incsearch                   
set hlsearch                    
set ignorecase                  
set smartcase                   

set autoindent                  
set expandtab                   
set tabstop=2                   
set expandtab
set shiftwidth=2
set softtabstop=2
set nojoinspaces

