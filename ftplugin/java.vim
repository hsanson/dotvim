setlocal omnifunc=javaapi#complete
"setlocal completefunc=javacomplete#CompleteParamsInfo
setlocal foldmethod=syntax

au CompleteDone *.java call javaapi#showRef()

if has("balloon_eval") && has("balloon_multiline")
  au BufNewFile,BufRead *.java setl bexpr=javaapi#balloon()
  au BufNewFile,BufRead *.java setl ballooneval
endif

let g:javaapi#delay_dirs = [
  \ 'java-api-javax',
  \ 'java-api-org',
  \ 'java-api-sun',
  \ 'java-api-servlet2.3',
  \ 'java-api-android',
  \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Building using ant
" http://blog.vinceliu.com/2007/08/vim-tips-for-java-1-build-java-files.html
"set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set makeprg=ant\ -find\ build.xml
