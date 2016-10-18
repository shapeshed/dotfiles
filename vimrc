" Us pathogen to manage plugins
" https://github.com/tpope/vim-pathogen
call pathogen#infect()

" Syntax Highlighting on
syntax on

" Let plugins determine indentation
filetype plugin indent on
let g:netrw_banner = 0

" Solarized color scheme
" http://ethanschoonover.com/solarized
set background=dark
color solarized
let g:airline_theme='solarized'

" Show line numbers
set number

" Alias for saving when not editing as sudo
cmap w!! %!sudo tee > /dev/null %

" JavaScript editing inline with node.js conventions
au FileType javascript setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et

set tabstop=2
set shiftwidth=2
set expandtab

set laststatus=2

set encoding=utf-8

if has("autocmd")
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

autocmd BufRead,BufNewFile *.md setlocal spell
