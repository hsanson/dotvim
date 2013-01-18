setlocal omnifunc=javacomplete#Complete
setlocal completefunc=javacomplete#CompleteParamsInfo
setlocal foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Building using ant
" http://blog.vinceliu.com/2007/08/vim-tips-for-java-1-build-java-files.html
"set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set makeprg=ant\ -find\ build.xml
