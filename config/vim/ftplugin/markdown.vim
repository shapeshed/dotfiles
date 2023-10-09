if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1
setlocal autoindent
setlocal nolisp
setlocal spell
setlocal noshowmatch
nnoremap <buffer> <Leader>< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
iabbrev <buffer> ![] ![Alt text][1]

compiler markdownlint
setlocal formatprg=prettier\ --parser\ markdown

function! Format()
    let w:v = winsaveview()
    silent normal gggqG
    call winrestview(w:v)
endfunction

augroup Markdown
    autocmd!
    autocmd BufWritePre <buffer> call Format()
augroup END

autocmd BufWritePost *.md silent make! <afile> | silent redraw!
autocmd QuickFixCmdPost [^l]* cwindow
