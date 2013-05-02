setlocal omnifunc=htmlcomplete#CompleteTags
setlocal textwidth=80
setlocal wrap
setlocal lbr
setlocal makeprg=markdown\ %\ >/tmp/%<.html
nmap <F5> <ESC>:silent! make<CR><C-l>
