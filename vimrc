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


nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

 au BufWritePost *.js :JSHint
 au! BufRead,BufNewFile *.json set filetype=json 

 set laststatus=2
 "let g:Powerline_symbols = 'fancy'
 let g:airline_powerline_fonts = 1
 set encoding=utf-8

 if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
 endif

 autocmd BufRead,BufNewFile *.md setlocal spell
