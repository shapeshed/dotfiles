" Use pathogen to manage plugins
" https://github.com/tpope/vim-pathogen
call pathogen#infect()

set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

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
