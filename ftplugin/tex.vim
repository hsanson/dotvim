let g:tex_flavor='latex'
setlocal iskeyword+=:
map <F5> <ESC>:silent! make<CR>:redraw!<CR>
let g:tex_fold_enabled=0
setlocal foldmethod=manual
setlocal textwidth=0    " Disable braking of long lines.
setlocal wrap           " Enable wrap of lines pass the right window border.
setlocal lbr            " Force wrap at word boundaries not chars
setlocal nolist         " List command breaks soft wrapping.
setlocal showbreak=…
setlocal makeprg=make
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

"" Enable concealed text that shows symbols like \beta as β
"" http://b4winckler.wordpress.com/2010/08/07/using-the-conceal-vim-feature-with-latex
setlocal cole=2

"" The following code to set the latex errorformat was taken from tex.vim
"" included in the latex-vim plugin. All credit goes there.

" ==============================================================================
" Customization of 'efm':  {{{
" This section contains the customization variables which the user can set.
" g:Tex_IgnoredWarnings: This variable contains a ¡ seperated list of
" patterns which will be ignored in the TeX compiler's output. Use this
" carefully, otherwise you might end up losing valuable information.
if !exists('g:Tex_IgnoredWarnings')
	let g:Tex_IgnoredWarnings =
		\'Underfull'."\n".
		\'Overfull'."\n".
		\'specifier changed to'."\n".
		\'You have requested'."\n".
		\'Missing number, treated as zero.'."\n".
		\'There were undefined references'."\n".
		\'Citation %.%# undefined'
endif
" This is the number of warnings in the g:Tex_IgnoredWarnings string which
" will be ignored.
if !exists('g:Tex_IgnoreLevel')
	let g:Tex_IgnoreLevel = 7
endif
" There will be lots of stuff in a typical compiler output which will
" completely fall through the 'efm' parsing. This options sets whether or not
" you will be shown those lines.
if !exists('g:Tex_IgnoreUnmatched')
	let g:Tex_IgnoreUnmatched = 1
endif
" With all this customization, there is a slight risk that you might be
" ignoring valid warnings or errors. Therefore before getting the final copy
" of your work, you might want to reset the 'efm' with this variable set to 1.
" With that value, all the lines from the compiler are shown irrespective of
" whether they match the error or warning patterns.
" NOTE: An easier way of resetting the 'efm' to show everything is to do
"       TCLevel strict
if !exists('g:Tex_ShowallLines')
	let g:Tex_ShowallLines = 0
endif

" }}}
" ==============================================================================
" Functions for setting up a customized 'efm' {{{

" IgnoreWarnings: parses g:Tex_IgnoredWarnings for message customization {{{
" Description: 
function! <SID>IgnoreWarnings()
	let i = 1
	while s:Strntok(g:Tex_IgnoredWarnings, "\n", i) != '' &&
				\ i <= g:Tex_IgnoreLevel
		let warningPat = s:Strntok(g:Tex_IgnoredWarnings, "\n", i)
		let warningPat = escape(substitute(warningPat, '[\,]', '%\\\\&', 'g'), ' ')
		exe 'setlocal efm+=%-G%.%#'.warningPat.'%.%#'
		let i = i + 1
	endwhile
endfunction 

" }}}
" SetLatexEfm: sets the 'efm' for the latex compiler {{{
" Description: 
function! <SID>SetLatexEfm()

	let pm = ( g:Tex_ShowallLines == 1 ? '+' : '-' )

	setlocal efm=
	" remove default error formats that cause issues with revtex, where they
	" match version messages
	" Reference: http://bugs.debian.org/582100
	setlocal efm-=%f:%l:%m
	setlocal efm-=%f:%l:%c:%m

	if !g:Tex_ShowallLines
		call s:IgnoreWarnings()
	endif

	setlocal efm+=%E!\ LaTeX\ %trror:\ %m
	setlocal efm+=%E!\ %m
	setlocal efm+=%E%f:%l:\ %m

	setlocal efm+=%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#
	setlocal efm+=%+W%.%#\ at\ lines\ %l--%*\\d
	setlocal efm+=%+WLaTeX\ %.%#Warning:\ %m

	exec 'setlocal efm+=%'.pm.'Cl.%l\ %m'
	exec 'setlocal efm+=%'.pm.'Cl.%l\ '
	exec 'setlocal efm+=%'.pm.'C\ \ %m'
	exec 'setlocal efm+=%'.pm.'C%.%#-%.%#'
	exec 'setlocal efm+=%'.pm.'C%.%#[]%.%#'
	exec 'setlocal efm+=%'.pm.'C[]%.%#'
	exec 'setlocal efm+=%'.pm.'C%.%#%[{}\\]%.%#'
	exec 'setlocal efm+=%'.pm.'C<%.%#>%m'
	exec 'setlocal efm+=%'.pm.'C\ \ %m'
	exec 'setlocal efm+=%'.pm.'GSee\ the\ LaTeX%m'
	exec 'setlocal efm+=%'.pm.'GType\ \ H\ <return>%m'
	exec 'setlocal efm+=%'.pm.'G\ ...%.%#'
	exec 'setlocal efm+=%'.pm.'G%.%#\ (C)\ %.%#'
	exec 'setlocal efm+=%'.pm.'G(see\ the\ transcript%.%#)'
	exec 'setlocal efm+=%'.pm.'G\\s%#'
	exec 'setlocal efm+=%'.pm.'O(%*[^()])%r'
	exec 'setlocal efm+=%'.pm.'P(%f%r'
	exec 'setlocal efm+=%'.pm.'P\ %\\=(%f%r'
	exec 'setlocal efm+=%'.pm.'P%*[^()](%f%r'
	exec 'setlocal efm+=%'.pm.'P(%f%*[^()]'
	exec 'setlocal efm+=%'.pm.'P[%\\d%[^()]%#(%f%r'
	if g:Tex_IgnoreUnmatched && !g:Tex_ShowallLines
		setlocal efm+=%-P%*[^()]
	endif
	exec 'setlocal efm+=%'.pm.'Q)%r'
	exec 'setlocal efm+=%'.pm.'Q%*[^()])%r'
	exec 'setlocal efm+=%'.pm.'Q[%\\d%*[^()])%r'
	if g:Tex_IgnoreUnmatched && !g:Tex_ShowallLines
		setlocal efm+=%-Q%*[^()]
	endif
	if g:Tex_IgnoreUnmatched && !g:Tex_ShowallLines
		setlocal efm+=%-G%.%#
	endif

endfunction 

" }}}
" Strntok: extract the n^th token from a list {{{
" example: Strntok('1,23,3', ',', 2) = 23
fun! <SID>Strntok(s, tok, n)
	return matchstr( a:s.a:tok[0], '\v(\zs([^'.a:tok.']*)\ze['.a:tok.']){'.a:n.'}')
endfun

call s:SetLatexEfm()
