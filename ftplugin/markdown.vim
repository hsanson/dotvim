setlocal omnifunc=htmlcomplete#CompleteTags
setlocal textwidth=0
setlocal wrapmargin=0
setlocal wrap linebreak nolist
setlocal showbreak=⪼
setlocal formatoptions+=l

" Enable j/k navigation inside long one line paragraphs.
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
