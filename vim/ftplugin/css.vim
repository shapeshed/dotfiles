if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

compiler stylelint
setlocal formatprg=prettier\ --parser\ css

function! Format()
    let w:v = winsaveview()
    silent normal gggqG
    call winrestview(w:v)
endfunction

augroup CSS
    autocmd!
    autocmd BufWritePre <buffer> call Format()
augroup END

autocmd BufWritePost *.css silent make! <afile> | silent redraw!
autocmd QuickFixCmdPost [^l]* cwindow
