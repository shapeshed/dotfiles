if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

compiler shellcheck
setlocal formatprg=shfmt

function! Format()
    let w:v = winsaveview()
    silent normal gggqG
    call winrestview(w:v)
endfunction
augroup Shell
    autocmd!
    autocmd BufWritePre <buffer> call Format()
augroup END

autocmd BufWritePost * silent make! <afile> | silent redraw!
autocmd QuickFixCmdPost [^l]* cwindow
