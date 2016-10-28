set nocompatible            " Welcome to the future

syntax on                   " Enable syntax highlighting
filetype plugin indent on   " allow plugins to determine indentation
color solarized             " Use solarized dark color scheme

let mapleader = ","         " Set leader to ,
let g:netrw_banner = 0      " disable_banner in filebrowser

set autoindent              " Copy indent from current line on <CR>               
set background=dark         " Set dark background
set belloff=all             " Silence terminal bell
set cursorline              " Highlight cursor line
set encoding=utf-8          " Set character encoding
set expandtab               " Expand tabs to spaces                
set filetype                " Trigger FileType autocommand
set hlsearch                    
set ignorecase                  
set incsearch                   
set laststatus=2            " Show statusbar all the time 
set number                      
set nojoinspaces
set showmatch                   
set shiftwidth=2
set softtabstop=2
set smartcase                   
set statusline=%f           " Path to file in the buffer
set statusline+=%m          " Modified flag
set statusline+=%=          " Right align what follows
set statusline+=%y          " Type of file in the buffer
" Show fileencoding type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" Show fileformat type
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%      " Percentage through the file in lines
set statusline+=\ \ %l:%c  " Line number and column number
set tabstop=2                   

if has("autocmd")
  " Open files in last saved position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  autocmd BufRead,BufNewFile *.go set noet ts=4 sw=4
  autocmd BufRead,BufNewFile *.md setlocal spell
endif

" faster editing and sourcing of `.vimrc`
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Alias for saving when not editing as sudo
cmap w!! %!sudo tee > /dev/null %
