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
set history=1000            " Keep a bigger history of commands
set hlsearch                " Highlight search matches
set ignorecase              " Ignore case when searching
set incsearch               " Show matches when searching
set laststatus=2            " Show statusbar all the time
set listchars=tab:>-        " Set tab character
set listchars+=trail:~      " Set trailing character
set list                    " Show list characters
set number                  " Print line numbers in front of each line
set ruler                   " Show line number and column number
set scrolloff=1             " Keep one line below the cursor
set showmatch               " Show matching bracket
set shiftwidth=2            " Number of spaces to use for (auto) indent
set softtabstop=2           " Number of tabs that a <Tab> counts for
set smartcase               " Override 'ignorecase' if search has uppercase
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
set tabstop=2               " The number of spaces that a <Tab> counts for
set ttimeout                " Timeout key sequences
set ttimeoutlen=50          " Timout after 50 milliseconds
set wrap                    " Wrap long lines

if has("autocmd")
  " Open files in last saved position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  autocmd BufRead,BufNewFile *.go set noet ts=4 sw=4
endif

" Fast editing and sourcing of `.vimrc`
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Alias for saving when not editing as sudo
cmap w!! %!sudo tee > /dev/null %
