" Description:
" 
" Folding for Markdown headers, both styles (atx- and setext-)
" http://daringfireball.net/projects/markdown/syntax#header
"
" Source:
" 
" https://gist.github.com/1035030
" 
" Usage:
" 
" this code can be placed in file
"   $HOME/.vim/after/ftplugin/markdown.vim

" In Markdown, setext-style overrides atx-style, so we first check for an
" underline. Empty lines should be ignored when underlined.
func! Foldexpr_markdown(lnum)
    let l1 = getline(a:lnum)
    if l1 =~ '^\s*$'
        return '='
    endif
    let l2 = getline(a:lnum+1)
    if  l2 =~ '^=\+\s*$'
        return '>1'
    elseif l2 =~ '^-\+\s*$'
        return '>2'
    elseif l1 =~ '^#'
        return '>'.matchend(l1, '^#\+')
    else
        return '='
    endif
endfunc
setl foldexpr=Foldexpr_markdown(v:lnum)
setl foldmethod=expr

"---------- everything after this is optional -----------------------
" change the following fold options to your liking
" see ':help fold-options' for more
setl foldenable
setl foldlevel=0
setl foldcolumn=0

" text of closed fold
" shows the first line as is, plus fold level and the number of hidden lines
setl foldtext=getline(v:foldstart).'\ \ \ /'.v:foldlevel.'...'.(v:foldend-v:foldstart)

"-------- other buffer- and window-local settings to override defaults
" setl wrap list
