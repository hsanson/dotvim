﻿" Vim syntax script
" Author: Peter Odding <peter@peterodding.com>
" Last Change: December 22, 2010
" URL: http://peterodding.com/code/vim/notes/

" Note: This file is encoded in UTF-8 including a byte order mark so
" that Vim loads the script using the right encoding transparently.

" Quit when a syntax file was already loaded.
if exists('b:current_syntax')
  finish
endif

" Check for spelling errors in all text.
syntax spell toplevel

" Inline elements. {{{1

" Cluster of elements which never contain a newline character.
syntax cluster notesInline contains=notesName

" Default highlighting style for notes syntax markers.
highlight def link notesHiddenMarker Ignore

" Highlight note names as hyperlinks. {{{2
call xolox#notes#highlight_names('notesName')
syntax cluster notesInline add=notesName
highlight def link notesName Underlined

" Highlight list bullets and numbers. {{{2
syntax match notesListBullet /^\s*\zs•/
highlight def link notesListBullet Comment
syntax match notesListNumber /^\s*\zs\d\+[[:punct:]]\?\ze\s/
highlight def link notesListNumber Comment

" Highlight text emphasized in italic font. {{{2
if has('conceal')
  syntax region notesItalic matchgroup=notesItalicMarker start=/\<_[A-Za-z]\@=/ end=/_\>\|\n/ contains=@Spell concealends
  highlight link notesItalicMarker notesHiddenMarker 
else
  syntax match notesItalic /\<_\w[^_]*\w_\>/
endif
syntax cluster notesInline add=notesItalic
highlight notesItalic gui=italic

" Highlight text emphasized in bold font. {{{2
if has('conceal')
  syntax region notesBold matchgroup=notesBoldMarker start=/\*\w\@=/ end=/\w\@<=\*/ contains=@Spell concealends
  highlight link notesBoldMarker notesHiddenMarker 
else
  syntax match notesBold /\*\w[^*]*\w\*/
endif
syntax cluster notesInline add=notesBold
highlight notesBold gui=bold

" Highlight domain names, URLs, e-mail addresses and filenames. {{{2
syntax match notesTextURL @\<www\.\(\S*\w\)\+[/?#]\?@
syntax cluster notesInline add=notesTextURL
highlight def link notesTextURL Underlined
if has('conceal')
  syntax region notesFullURL matchgroup=notesURLScheme start=@\<\(mailto:\|javascript:\|\w\{3,}://\)@ end=/\([[:punct:]]\s\|\s\|$\)\@=/ concealends
  highlight def link notesURLScheme notesFullURL
else
  syntax match notesFullURL @\<\(mailto:\|javascript:\|\w\{3,}://\)\(\S*\w\)\+[/?#]\?@
endif
syntax cluster notesInline add=notesFullURL
highlight def link notesFullURL Underlined

syntax match notesEmailAddr /\<\w[^@ \t\r]*\w@\w[^@ \t\r]\+\w\>/
syntax cluster notesInline add=notesEmailAddr
highlight def link notesEmailAddr Underlined
syntax match notesUnixPath /\w\@<![\/~]\S\+\(\/\|[^ [:punct:]]\)/ contains=notesName | " <- UNIX style pathnames
syntax cluster notesInline add=notesUnixPath
highlight def link notesUnixPath Directory
syntax match notesWindowsPath /\w\@<![A-Za-z]:\S\+\([\\/]\|[^ [:punct:]]\)/ contains=notesName | " <- Windows style pathnames
syntax cluster notesInline add=notesWindowsPath
highlight def link notesWindowsPath Directory

" Highlight TODO, DONE and XXX markers. {{{2
syntax match notesTodo /\<TODO\>/
syntax match notesXXX /\<XXX\>/
syntax match notesDoneItem /^\(\s\+\).*\<DONE\>.*\(\n\1\s.*\)*/ contains=@notesInline
syntax match notesDoneMarker /\<DONE\>/ containedin=notesDoneItem
highlight link notesTodo WarningMsg
highlight link notesXXX WarningMsg
highlight link notesDoneItem Comment
highlight link notesDoneMarker Question

" Highlight Vim command names in :this notation. {{{2
syntax match notesVimCmd /:\w\+\(!\|\>\)/ contains=ALLBUT,@Spell
syntax cluster notesInline add=notesVimCmd
highlight def link notesVimCmd Special

" Block level elements. {{{1

" The first line of each note contains the title. {{{2
syntax match notesTitle /^.*\%1l.*$/ contains=@notesInline
highlight def link notesTitle ModeMsg

" Short sentences ending in a colon are considered headings. {{{2
syntax match notesShortHeading /^\s*\zs\u.\{1,50}\w:\ze\(\s\|$\)/ contains=@notesInline
highlight def link notesShortHeading Title

" Atx style headings are also supported. {{{2
syntax match notesAtxHeading /^#\+.*/ contains=notesAtxMarker,@notesInline
highlight def link notesAtxHeading Title
syntax match notesAtxMarker /^#\+/ contained
highlight def link notesAtxMarker Comment

" E-mail style block quotes are highlighted as comments. {{{2
syntax match notesBlockQuote /\(^\s*>.*\n\)\+/ contains=@notesInline
highlight def link notesBlockQuote Comment

" Horizontal rulers. {{{2
syntax match notesRule /\(^\s\+\)\zs\*\s\*\s\*$/
highlight link notesRule Comment

" Highlight embedded blocks of source code, log file messages, basically anything Vim can highlight. {{{2
" NB: I've escaped these markers so that Vim doesn't interpret them when editing this file…
syntax match notesCodeStart /{{[{]\w*/
syntax match notesCodeEnd /}}[}]/
highlight link notesCodeStart Ignore
highlight link notesCodeEnd Ignore
call xolox#notes#highlight_sources('notesCodeStart', 'notesCodeEnd')

" Hide mode line at end of file. {{{2
syntax match notesModeLine /\_^vim:.*\_s*\%$/
highlight def link notesModeLine LineNr

" }}}1

" Set the currently loaded syntax mode.
let b:current_syntax = 'notes'

" vim: ts=2 sw=2 et bomb fdl=1
