setlocal omnifunc=xmlcomplete#CompleteTags
let g:xml_syntax_folding=1
setlocal foldmethod=syntax

if android#isAndroidProject()
  nmap <F5> <ESC>:AndroidDebugInstall<CR>
endif
