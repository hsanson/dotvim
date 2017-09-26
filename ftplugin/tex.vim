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

nnoremap <leader>lv :VimtexView<Enter>
nnoremap <leader>ll :VimtexCompile<Enter>
nnoremap <leader>lp :VimtexTocToggle<Enter>
nnoremap <leader>lt :VimtexLabelsToggle<Enter>

"" Enable concealed text that shows symbols like \beta as β
"" http://b4winckler.wordpress.com/2010/08/07/using-the-conceal-vim-feature-with-latex
setlocal cole=2

