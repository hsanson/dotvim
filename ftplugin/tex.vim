let g:tex_flavor='latex'
setlocal iskeyword+=:
setlocal grepprg=grep\ -nH\ $*
let g:tex_fold_enabled=0
setlocal foldmethod=manual
setlocal textwidth=0    " Disable braking of long lines.
setlocal wrap           " Enable wrap of lines pass the right window border.
setlocal lbr            " Force wrap at word boundaries not chars
setlocal nolist         " List command breaks soft wrapping.
setlocal showbreak=…
vnoremap j gj
vnoremap k gk
vnoremap 4 g$
vnoremap 6 g^
vnoremap 0 g^
nnoremap j gj
nnoremap k gk
nnoremap 4 g$
nnoremap 6 g^
nnoremap 0 g^
