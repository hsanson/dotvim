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
filetype off " Needed so pathogen also loads ftdetect plugins.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Re-enable per filetype plugins and indents after loading pathogen plugin
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
" Improve Vim's Command Line Autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=full wildmenu              " Command-line tab completion
set infercase                           " AutoComplete in Vim
set completeopt=longest,menu,menuone
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.db,*.swc

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Improve QuickFix Window
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always open the quickfix window when running make, grep, grepadd and vimgrep
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep :botright cwindow
map <F6> <ESC>:cN<CR>                " Jump to prev error or warn
map <F7> <ESC>:cn<CR>                " Jump to next error or warn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Ack Plugin
""
"" Installation:
""  - sudo aptitude install ack-grep
""  - Make sure you have pathogen.vim installed an enabled.
""  - cd ~/.vim
""  - mkdir -p bundle
""  - git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
"" Usage:
""  - :Ack [options] {pattern} [{directory}]
"" Resources:
""   http://betterthangrep.com/
""   http://amaslov.wordpress.com/2009/04/23/vim-ack-instead-of-grep/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Neocomplcache Plugin
"" 
"" Description:
""  A auto-complete plugin that actually works!
""
"" Installation:
""  - Make sure you have pathogen.vim installed an enabled.
""  - cd ~/.vim
""  - mkdir -p bundle
""  - git submodule add https://github.com/Shougo/neocomplcache.git bundle/neocomplcache
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1             " Enable neocomplcache
let g:neocomplcache_enable_smart_case = 1             " Use smart case
let g:neocomplcache_enable_camel_case_completion = 1  " Use camel case completion
let g:neocomplcache_enable_underbar_completion = 1    " Use underbar completion
let g:neocomplcache_min_syntax_length = 3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VimOutliner Plugin
"" 
"" Description:
""  Outliner plugin for Vim.
""
"" Installation:
""  - Make sure you have pathogen.vim installed an enabled.
""  - cd ~/.vim
""  - mkdir -p bundle
""  - mkdir -p bundle/outliner
""  - cd bundle/outliner
""  - wget http://www.troubleshooters.com/projects/alt-vimoutliner-litt/download/0.3.4/vimoutliner-0.3.4.tgz
""  - tar xvfz vimoutliner-0.3.4.tgz
""  - mv vimoutliner-0.3.4/* ./
""  - rm -rf vimoutliner-0.3.4*
""
"" Fix:
""  - Edit bundle/outliner/ftdetect/vo_base.vim and remove everything except the
""    two au! commands:
""
""       au! BufRead,BufNewFile *.otl»·»·setfiletype vo_base
""       au! BufRead,BufNewFile *.oln»·»·setfiletype xoutliner 
""
""  - Edit bundle/outliner/ftplugin/vo_base.vim and change the tabstop/shiftwidth to 2
""
""       setlocal tabstop=2
""       setlocal shiftwidth=2
""
"" Resources:
""  http://www.troubleshooters.com/projects/alt-vimoutliner-litt/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vo_modules_load = "checkbox:hoist"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" tGPG Plugin
"" 
"" Description:
""  tGPG Plugin for transparent editing of encrypted files.
""
"" Installation:
""  - Make sure you have pathogen.vim installed an enabled.
""  - cd ~/.vim
""  - mkdir -p bundle
""  - git submodule add https://github.com/tomtom/tgpg_vim.git bundle/tgpg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Matchit Plugin
"" 
"" Description:
""  Allows you to configure % to match more than just single characters.
""
"" Installation:
""  - Make sure you have pathogen.vim installed an enabled.
""  - cd ~/.vim
""  - mkdir -p bundle/matchit
""  - wget http://www.vim.org/scripts/download_script.php?src_id=8196 --output-document=matchit.zip
""  - unzip -d bundle/matchit matchit.zip
""  - rm -f matchit.zip
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Surround Plugin
"" 
"" Description:
""  Plugin for deleting, changing, and adding surroundings.
""
"" Installation:
""  - Make sure you have pathogen.vim installed an enabled.
""  - cd ~/.vim
""  - mkdir -p bundle
""  - git submodule add https://github.com/tpope/vim-surround.git bundle/surround
""
"" Usage:
""  Old text                  Command     New text ~
""  Hello *world!"            ds"         Hello world!
""  [123+4*56]/2              cs])        (123+456)/2
""  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
""  if *x>3 {                 ysW(        if ( x>3 ) {
""  my $str = *whee!;         vlllls'     my $str = 'whee!';
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

