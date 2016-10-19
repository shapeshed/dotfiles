if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

map <buffer> <Leader>< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
abbreviate <buffer> ![] ![Alt text][1]
