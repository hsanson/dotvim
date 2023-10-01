setlocal autoindent
setlocal expandtab
setlocal tabstop=8
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=0
setlocal wrap
setlocal linebreak
setlocal spell

setlocal formatoptions=cqln
setlocal formatlistpat=^\\s*
setlocal formatlistpat+=[
setlocal formatlistpat+=\\[({]\\?
setlocal formatlistpat+=\\(
setlocal formatlistpat+=[0-9]\\+
setlocal formatlistpat+=\\\|
setlocal formatlistpat+=[a-zA-Z]
setlocal formatlistpat+=\\)
setlocal formatlistpat+=[\\]:.)}
setlocal formatlistpat+=]
setlocal formatlistpat+=\\s\\+
setlocal formatlistpat+=\\\|
setlocal formatlistpat+=^\\s*-\\s\\+
setlocal formatlistpat+=\\\|
setlocal formatlistpat+=^\\s*[*]\\+\\s\\+
setlocal comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

setlocal includeexpr=substitute(v:fname,'include::\\(.\\{-}\\)\\[.*','\\1','g')
setlocal comments=
setlocal commentstring=//\ %s

nnoremap j gj
nnoremap k gk
