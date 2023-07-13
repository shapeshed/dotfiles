if exists('current_compiler')
  finish
endif
let current_compiler = "markdownlint"

let s:cpo_save = &cpo
set cpo-=C

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=markdownlint

setlocal errorformat=%f:%l:%c\ MD0%n/%m
setlocal errorformat+=%f:%l\ MD0%n/%m
setlocal errorformat+=%-G%.%#
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
