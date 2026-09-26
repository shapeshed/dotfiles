" Trim trailing whitespace, and trailing blank lines.
function! format#TrimWhitespace() abort
  let curw = winsaveview()
  keepjumps keeppatterns %s/\s\+$//e
  keepjumps keeppatterns silent! 0;/^\%(\n*.\)\@!/,$d
  call winrestview(curw)
endfunction
