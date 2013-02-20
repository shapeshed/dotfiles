" Us pathogen to manage plugins
" https://github.com/tpope/vim-pathogen
call pathogen#infect()

" Syntax Highlighting on
syntax on

" Let plugins determine indentation
filetype plugin indent on

" Solarized color scheme
" http://ethanschoonover.com/solarized
set background=dark
color solarized

" Show line numbers
set number

" Alias for saving when not editing as sudo
cmap w!! %!sudo tee > /dev/null %

" JavaScript editing inline with node.js conventions
au FileType javascript setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et

" CoffeeScript
let coffee_compile_vert = 1
hi link coffeoSpaceError NONE
hi link coffeeSemicolonError NONE
hi link coffeeReservedError NONE
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

set tabstop=2
set shiftwidth=2
set expandtab

 au BufWritePost *.js :JSHint
 au! BufRead,BufNewFile *.json set filetype=json 

 set laststatus=2
 let g:Powerline_symbols = 'fancy'
 set encoding=utf-8

 if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
 endif
