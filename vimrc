set nocompatible                      " Welcome to the future

syntax on                             " Enable syntax highlighting
filetype plugin indent on             " allow plugins to determine indentation
color solarized                       " Use solarized dark color scheme

let mapleader = ","                   " Set leader to ,
let g:netrw_banner = 0                " disable_banner in filebrowser

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set autoindent                        " Copy indent from current line on <CR>
set background=dark                   " Set dark background
set belloff=all                       " Silence terminal bell
set cursorline                        " Highlight cursor line
set encoding=utf-8                    " Set character encoding
set expandtab                         " Expand tabs to spaces
set history=1000                      " Keep a bigger history of commands
set hlsearch                          " Highlight search matches
set grepprg=git\ grep\ -n\ $*         " Use git grep for searching
set ignorecase                        " Ignore case when searching
set incsearch                         " Show matches when searching
set laststatus=2                      " Show statusbar all the time
set swapfile                          " Save a swapfile
set backupdir=/tmp                    " Location for backup files
set dir=/tmp                          " Location for swapfiles
"set listchars=tab:>-                 " Set tab character
"set listchars+=trail:~               " Set trailing character
"set list                             " Show list characters
set number                            " Print line numbers in front of each line
set path=$PWD/**                      " Search recursively for file related tasks
set ruler                             " Show line number and column number
set scrolloff=1                       " Keep one line below the cursor
set showmatch                         " Show matching bracket
set shiftwidth=2                      " Number of spaces to use for (auto) indent
set softtabstop=2                     " Number of tabs that a <Tab> counts for
set smartcase                         " Override 'ignorecase' if search has uppercase
set statusline=                       " Custom status line
set statusline+=%#PmenuSel#           " Show git branch if it exists
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f                  " Show file name
set statusline+=%m\                   " Show whether file has been modified
set statusline+=%=                    " Right align the following
set statusline+=%#CursorColumn#
set statusline+=\ %y                  " Filetype
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " File encoding
set statusline+=\[%{&fileformat}\]    " File format
set statusline+=\ %p%%                " Percentage through file
set statusline+=\ %l:%c               " Line number:Column number
set statusline+=\ 
set tabstop=2                         " The number of spaces that a <Tab> counts for
set ttimeout                          " Timeout key sequences
set ttimeoutlen=50                    " Timout after 50 milliseconds
set wildignore+=*node_modules/**      " Ignore node_modules
set wildignore+=.git
set wildignore+=*~,*.swp,*.swo,*.tmp
set wildmenu                          " Enable command-line completion
set wrap                              " Wrap long lines

if has("autocmd")
  " Open file at last saved position
  augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
  augroup END
endif

" Fast editing and sourcing of `.vimrc`
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Alias for saving when not editing as sudo
cmap w!! %!sudo tee > /dev/null %

" Plugin settings
let g:go_fmt_command = "goimports"
