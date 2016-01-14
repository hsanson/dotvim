setlocal omnifunc=javacomplete#Complete
"setlocal completefunc=javacomplete#CompleteParamsInfo
setlocal foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Building using ant
" http://blog.vinceliu.com/2007/08/vim-tips-for-java-1-build-java-files.html
"set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set makeprg=ant\ -find\ build.xml

if android#isAndroidProject()
  nmap <F5> <ESC>:AndroidInstall debug<CR>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Add folding directives for java files
"" http://vim.wikia.com/wiki/Syntax_folding_for_Java

"" Fold braces and javadoc
syn region foldBraces start=/{/ end=/}/ transparent fold
syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend

"" Allow folding of import directives.
syn keyword javaExternal native package
syn region foldImports start=/\(^\s*\n^import\)\@<= .\+;/ end=+^\s*$+ transparent fold keepend

