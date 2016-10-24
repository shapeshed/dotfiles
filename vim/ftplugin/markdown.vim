if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

nnoremap <buffer> <Leader>< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
iabbrev <buffer> ![] ![Alt text][1]
setlocal spell
setlocal nolisp
setlocal autoindent
setlocal comments=b:*,b:+,b:-
setlocal comments+=b:>
set textwidth=80
