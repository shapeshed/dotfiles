if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal autoindent
setlocal nolisp
setlocal spell
setlocal textwidth=80
setlocal noshowmatch

nnoremap <buffer> <Leader>< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
iabbrev <buffer> ![] ![Alt text][1]
