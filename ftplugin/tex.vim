let g:tex_flavor='latex'
setlocal iskeyword+=:
setlocal grepprg=grep\ -nH\ $*
let g:tex_fold_enabled=1
setlocal foldmethod=syntax
setlocal textwidth=0    " Disable braking of long lines.
setlocal wrap           " Enable wrap of lines pass the right window border.
setlocal lbr            " Force wrap at word boundaries not chars
nnoremap k gk      " Enable navigation within long lines (up)
nnoremap j gj      " Enable navigation within long lines (down)
