"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General Settings
""
"" Make sure you have installed these packages:
""   sudo aptitude install vim-ruby vim-scripts vim-common vim-gui-common \
""        ack-grep exuberant-ctags
""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                      " Disable vi compatibility.
set fileformats=unix,dos              " Use unix file format.
set number                            " Show line number column.
set nobackup                          " Stop vim from creating ~ files.
set showcmd                           " Display commands as they are typed.
set ttyfast                           " Smoother screen redraws.
set hlsearch                          " Highlight search results.
set showmatch                         " Show briefly matching bracket when closing it.
autocmd InsertEnter * se cul          " Highlight current line in Insert Mode. 
autocmd InsertLeave * se nocul        " Don't highlight current line in other modes.

" Set search path for gf command
set path=/usr/include,/usr/local/include,**;$HOME

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Sane plugin management using Pathogen.vim
""
"" Resources:
""   http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
""
"" Installation:
""   mkdir -p ~/.vim/autoload
""   cd ~/.vim/autoload
""   wget --no-check-certificate https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim
""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the pathogen plugin. Make sure you do this before enabling filetype detection.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Enable per filetype plugins and indents
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Look and Feel Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                             " Enable syntax highlighting.
set t_Co=256                          " Enable 256 color mode in terminal.
set background=dark                   " I like dark backgrounds.
colors vividchalk                     " My current favorite color scheme.

" Show tabs and tailing spaces.
" Note: to insert the middle point press ctrl+k .M in insert mode
:set list
:set listchars=tab:»·,trail:⋅,nbsp:⋅

" By default insert spaces instead of tabs. This may be overriden by the
" configuration inside ftplugin directory.
" Note: If you want a real tab use "ctrl-v, tab" in insert mode.
set expandtab

" Number of spaces to insert for a tab
set shiftwidth=2
set tabstop=2
set softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Word Wrap
"
" Auto formatting options. These determine where lines will be broken when
" auto wrapping. The last to (m/M) are needed for multi byte characters (e.g.
" Japanese)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions=tcqmM

" There are two word wrap methods, one with line breaks that adds an actual
" '\n' character at the break place and without line breaks that only displays
" text as wrapped but there is no actual break added to the text.

" Word wrap with line breaks.
" Use "gq}" to wrap the current paragraph if it is not well formatted.
set textwidth=80    " Force wrap for lines longer than 80 characters

" Vim Tip #989: Word wrap without line breaks lines.
"set wrap           " Force wrap for lines linger than the vim window
"set lbr            " Force wrap at word boundaries not chars
"nnoremap k gk      " Enable navigation within long lines (up)
"nnoremap j gj      " Enable navigation within long lines (down)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Character encoding settings
"" By manipulating this variables it is possible to edit all files in one 
"" encoding while using the terminal in a different encoding and writing/reading
"" the file in another encoding. Here we set all three variables to UTF-8.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Default file encoding for new files
setglobal fenc=utf-8

" Auto detect file encoding when opening a file. To check what file encoding was
" selected run ":set fenc" and if you know the auto detection failed and want to
" force another one run ":edit ++enc=<your_enc>".
set fencs=utf-8,euc-jp,sjis

" Internal encoding used by vim buffers, help and commands
set encoding=utf-8

" Terminal encoding used for input and terminal display
" Make sure your terminal is configured with the same encoding.
set tenc=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NERDTree Plugin
""
"" Installation:
""  - Make sure you have pathogen.vim installed an enabled.
""  - cd ~/.vim
""  - mkdir -p bundle
""  - git submodule add https://github.com/scrooloose/nerdtree.git bundle/nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the window width
let g:NERDTreeWinSize = 35
" Set the window position
let g:NERDTreeWinPos = "left"
" Auto centre
let g:NERDTreeAutoCenter = 0
" Not Highlight the cursor line
let g:NERDTreeHighlightCursorline = 0
" Don't change working directory when opening files
set noautochdir
let g:NERDTreeChDirMode = 2
" Show bookmarks list
let g:NERDTreeShowBookmarks = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VCSCommand Plugin
"" 
"" Description:
""  This plugin enables a generic interface to all common source version control
""  systems (e.g. svn, git, hg, cvs). If you only use Git you may consider to
""  use the vim-fugitive plugin instead.
""
"" Installation:
""  - Make sure you have pathogen.vim installed an enabled.
""  - cd ~/.vim
""  - mkdir -p bundle
""  - git submodule add git://repo.or.cz/vcscommand.git bundle/vcscommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VCSCommandEnableBufferSetup = 1
set laststatus=2
set statusline=%{VCSCommandGetStatusLine()}[%f]%=0x%B\ \ \ [%(%l/%L,%c%V%)]\ \ (%p%%)
"set statusline=[%f]%=0x%B\ \ \ [%(%l/%L,%c%V%)]\ \ (%p%%)

