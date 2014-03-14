"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Description:
""  This vimrc is my default vim configuration file.
""
"" Prerequisites:
""  - This configuration has been tested only on Ubuntu/Kubuntu 10.10 or later.
""    It may work in lower Ubuntu versions and other Debian distributions but
""    there is no guarantee.
""
"" Installation:
""
""  - The vim packaged with Ubuntu is a little bit outdated and uses old libs
""    like ruby1.8. To get the best experience it is recommended to install vim
""    from sources.
""
""  - Install packages required to build and use vim:
""
""    sudo apt-get install mercurial gettext libncurses5-dev libxmu-dev \
""      libgtk2.0-dev libperl-dev python-dev python2.7-dev ruby-dev tcl-dev \
""      liblua5.1-0-dev liblua5.2-dev luajit build-essential ruby1.9.1 \
""      ruby1.9.1-dev exuberant-ctags libx11-dev xorg-dev git-core wget sed \
""      ack-grep
""
""  - Fix lua links
""
""      sudo ln -s /usr/include/lua5.1 /usr/include/lua
""      sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.1.so /usr/lib/x86_64-linux-gnu/liblua.so
""
""  - Download vim source code from mercurial
""
""      hg clone https://code.google.com/p/vim  ~/vim
""
""  - Compile vim
""
""      ./configure --prefix=/usr/local --with-features=huge \
""          --enable-pythoninterp --enable-rubyinterp --enable-gui=gtk2 \
""          --enable-perlinterp --enable-pythoninterp \
""          --with-python-config-dir=/usr/lib/python2.7/config  \
""          --enable-cscope --enable-multibyte  --enable-cscope --with-x \
""          --enable-tclinterp --enable-luainterp=dynamic \
""          --with-lua-prefix=/usr --enable-fail-if-missing
""      make
""      sudo make install
""
""  - Install vundle
""
""    mkdir -p ~/.vim/bundle
""    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
""
""  - Update the plugins via vundle
""
""    vim +BundleInstall +qall
""
""  Usage:
""    Don't copy this vim repo and expect it work for you. Use this vimrc as
""    example to build your own vimrc.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                      " Disable vi compatibility.
set bs=2                              " Sane backspace behavior.
set fileformats=unix,dos              " Use unix file format.
set number                            " Show line number column.
set nobackup                          " Stop vim from creating ~ files.
set nojoinspaces                      " Avoid double spaces when joining lines
set showcmd                           " Display commands as they are typed.
set ttyfast                           " Smoother screen redraws.
set showmatch                         " Show briefly matching bracket when closing it.
set scrolloff=9999                    " Always keep the cursor at the center of window.
set lazyredraw                        " Improve performance
set synmaxcol=200                     " Improve scroll performance with long lines
"set hidden                           " Allow change buffer without saving.
set nofoldenable                      " Disable folding that slows down auto-completion
set nrformats=                        " Stop vim from treating zero padded numbers as octal
"set foldlevelstart=99
autocmd InsertEnter * se cul          " Highlight current line in Insert Mode.
autocmd InsertLeave * se nocul        " Don't highlight current line in other modes.
set switchbuf=useopen,usetab
cmap w!! w !sudo tee % >/dev/null     " Save file as root

set hlsearch                          " Highlight search results.
set incsearch
set ignorecase
set smartcase

" Set search path for gf command
set path=/usr/include,/usr/local/include,**;$HOME

" Move swap files out of the current directory. This is useful to avoid swp
" files from accidentally entering your git repos or to avoid them being sync
" when editing a file in a dropbox/ubuntuone folder.
set directory=/var/tmp,/tmp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Improve undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undolevels=10000
if has("persistent_undo")
  set undodir=~/.vim/undo
  set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Disable arrow keys to become vim master
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map make for easy access
" map <F5> <ESC>:silent! make<CR><C-l>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Improve QuickFix Window

" Tip: http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
" Automatically open the quickfix window on :make or close it when it has become
" empty.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Move the quickfix window to the bottom of the vim window.
autocmd FileType qf wincmd J

" Add fast navigation shorcuts.
map <F6> <ESC>:cN<CR>                " Jump to prev error or warn
map <F7> <ESC>:cn<CR>                " Jump to next error or warn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Mouse Settings
"" Enabling the mouse has some advantages:
""   - You can resize windows using the mouse instead of using Ctrl-W combinations.
""   - Selecting text with the mouse wont include the left numbering.
"" Note: Mouse features do not work when running vim inside a tmux window.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nv                           " Enable the mouse.
set mousehide
"set ttymouse=xterm2                   " Allow text selction work with tmux

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vundle Plugin
""
"" Description:
""  Nice vim plugin manager.
""
"" Usage:
""
""  Define your plugins using the Bundle command. After that we have some
""  commands to handle the plugins.
""
""  :BundleList          - List configured bundles
""  :BundleInstall       - Install (update) bundles.
""  :BundleSearch foo    - Search for bundle foo
""  :BundleClean         - Remove unused bundles
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom text objects
"
" Vim text-objs are important for fast editing of text. Defining new text
" objects allow operators to work on blocks of texts other than chars, words and
" paragraphs.
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-function'
Bundle 'rbonvall/vim-textobj-latex'

Bundle 'joeytwiddle/sexy_scroller.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Intent Guides plugin
"
" Description:
"   Shows guides to easily track indent lines.
Bundle "Yggdroot/indentLine"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs vs Spaces war
"
" By default insert spaces instead of tabs. This may be overriden by the
" configuration inside ftplugin directory for specific file types. For example
" makefiles require real tabs to work so override this configuration in the
" ftplugin make.vim file.
"
" Note: If you want a real tab use "ctrl+v tab" in insert mode. That is control
" + v follwed by a tab.
set expandtab

" Number of spaces to insert for a tab
set shiftwidth=2
set tabstop=2
set softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Improve Vim's Command Line Autocompletion
set wildmode=full wildmenu              " Command-line tab completion
set infercase                           " AutoComplete in Vim
set completeopt=longest,menu,menuone
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.db,*.swc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Improve TOhtml output
let html_use_css = 1
let html_ignore_folding = 1
let html_number_lines = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Word Wrap
"
" Auto formatting options. These determine where lines will be broken when
" auto wrapping. The last two options (mM) are needed for multi byte characters (e.g.
" Japanese)
set formatoptions=tcqjmM

" There are two word wrap methods, one with line breaks that adds an actual
" '\n' character at the break place and without line breaks that only displays
" text as wrapped but there is no actual break added to the text.

" To enable word wrap with line breaks use the textwidth option below.
" Note: Use "gq}" to wrap the current paragraph if it is not well formatted.

set textwidth=80    " Force wrap for lines longer than 80 characters

" To enable word wrap without actual line breaks comment textwidth option above
" and enable the options below (Vim Tip #989):

"set textwidth=0    " Disable braking of long lines.
"set wrap           " Enable wrap of lines pass the right window border.
"set lbr            " Force wrap at word boundaries not chars
"nnoremap k gk      " Enable navigation within long lines (up)
"nnoremap j gj      " Enable navigation within long lines (down)

"" Mark with a different background the column 81 for lines that pass over that
"" limit.
if exists('+colorcolumn')
  highlight ColorColumn ctermbg=darkgrey guibg=darkgrey
  call matchadd('ColorColumn', '\%81v', 100)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Character encoding settings
""
"" This settings are important if you need to handle files with different text
"" encodings. In my case I need to read source files with japanese comments that
"" are usually encoded in shift-jis and latex documents usually encoded in euc-jp
"" but keep my terminal and input methods (iBus/scim/anthy) displaying in UTF-8/

"" The character encoding used to display and input text to the terminal. My
"" terminal is always UTF-8 and as far as I know the input methods for japanese
"" supported by Ubuntu are also UTF-8. For this I make sure vim displays and
"" accepts only UTF-8 encoded text with the tenc parameter.
set tenc=utf-8

"" Also I prefer to handle all my files in disk as UTF-8 to avoid unnecessary
"" convertions between encoding formats. If the encoding format of a file on
"" disk is different from the terminal one then vim will automatically convert
"" between the two encodings when saving on disk and displaying on the terminal.
"" Note that not all encoding conversions are reversible so there may be some
"" loss of information. This is why is recommended to use always the same
"" encoding.
setglobal fenc=utf-8

"" Unfortunately some others at my work use other encodings that I need to
"" handle too. If I open a file with a lot of sjis coded text and save it back
"" as UTF-8 (fenc=utf-8) when my co-workers open the file they will only see
"" garbage. Always make sure fenc is set to the correct text encoding.
"" The fencs option can try to autodetect the file encoding but it may fail some
"" times. If you see only garbage when opening a file you can use ":set fenc" to
"" check what encoding was detected. If you know it is wrong you can force vim
"" to use a different file encoding with the command ":edit ++enc=<your_enc>".
"" If you still see garbage make sure you have a font that can display that
"" encoding.
set fencs=utf-8,euc-jp,sjis

" Internal encoding used by vim buffers, help and commands. This is better to
" keep the same s tenc.
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Slim Plugin
"
" Description:
"   Add file type detection rules and syntax highlighting for slim templates.
Bundle 'slim-template/vim-slim.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex Plugin
"
" Description:
"   Simple but full featured plugin for writing LaTeX document in vim.
"
" Prerequisites:
"  If you want to compile using Xelatex instead of simple latex make sure to
"  create a .latexmkrc file inside the project folder that contains:
"
"    $pdflatex=q/xelatex -synctex=1 %O %S/
"
"  also ensure the build directory exists or the build process would fail.
"
" Usage:
"
"   -  \ll  ->  Compile document
"   -  \lc  ->  Clean auxiliar files
"   -  \lv  ->  View compiled document
"   -  \lo  ->  Use synctex to jump to the same section in PDF file
"   -  \le  ->  Load log in quickfix window

Bundle 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_completion_close_braces = 1
let g:LatexBox_latexmk_async = 0
"let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 2
let g:LatexBox_autojump = 1
let g:LatexBox_show_warnings = 1

" Add custom search paths
"   TEXINPUTS Path to search for .tex files
"   BSTINPUTS Path to search for .bst files
"   BIBINPUTS Path to search for .bib files
let g:LatexBox_latexmk_env="TEXINPUTS=:${PWD}//: BSTINPUTS=:${PWD}//: BIBINPUTS=:${PWD}//: "

let g:LatexBox_build_dir = "build"
"let g:LatexBox_latexmk_options = "-pdflatex='xelatex %O %S' -latex='xelatex %O %S' -jobname=build/main"
let g:LatexBox_latexmk_options = "-jobname=build/main"
let g:LatexBox_viewer = "okular --unique"
let g:ycm_semantic_triggers = { 'tex': ['cite{'] }

""
" Function that opens the output file and uses synctex to jump to the section
" that corresponds to the current line in the tex document.
function! LatexBox_View2()
  let outfile = LatexBox_GetOutputFile()
  if !filereadable(outfile)
    echomsg fnamemodify(outfile, ':.') . ' is not readable'
    return
  endif
  let outfile2 = outfile . '\#src:' . line(".") . expand("%:p")
  let cmd = g:LatexBox_viewer . ' ' . shellescape(outfile2)
  if has('win32')
    let cmd = '!start /b' . cmd . ' >nul'
  else
    let cmd = '!' . cmd . ' &>/dev/null &'
  endif
  silent execute cmd
  if !has("gui_running")
    redraw!
  endif
endfunction

command! LatexView2 call LatexBox_View2()

map <buffer> <LocalLeader>lo :LatexView2<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Groovy Syntax
Bundle 'vim-scripts/groovy.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javacomplete Plugin
"
" Description:
"   Enables omnicompletion of java classes, packages and methods.
"
" Installation:
"
"   - Install via vundle or pathogen.
"   - Compile the Reflection.java file
"
"     cd ~/vim/bundle/javacomplete/autoload
"     javac Reflection.java
"
"   - Add the following to ftplugin/java.vim. Create the file if
"     it does not exists.
"
"     setlocal omnifunc=javacomplete#Complete
"     setlocal completefunc=javacomplete#CompleteParamsInfo
"
"     If you use the NeoComplCache plugin then comment out the completefunc
"     option so it does not conflict with NeoComplCache.
"
" Usage:
"   This uses normal omnicompletion with Ctrl-X Ctrl-O to invoke the
"   autocompletion. I recommend instead to use NeoComplCache to have automatic
"   autocompletion.

"Bundle 'vim-scripts/javacomplete'
"Bundle 'nwertzberger/javacomplete'
"Bundle 'itszero/javacomplete'
"Bundle 'adragomir/javacomplete'
"Bundle 'vim-scripts/javaimports.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-im Plugin
"
" Description:
"   Disables input methods when leaving insert mode
Bundle 'hsanson/vim-im'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-resize Plugin
"
" Description:
"  Enables more fluid resizing of split windows
Bundle 'hsanson/vim-resize'

nnoremap <C-k> :ResizeUp<CR>
noremap <C-j> :ResizeDown<CR>
noremap <C-h> :ResizeLeft<CR>
noremap <C-l> :ResizeRight<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-android Plugin
""
"" Description:
""   Configures vim to make it easier to develop android applications.
""
"" Installation:
""   - Require javacomplete plugin for vim configured and running properly.
""   - Install plugin via pathogen or vundle
""   - Set the g:android_sdk_path to your the place you have installed the
""     android sdk. Use absolute path.
""
"" Usage:
""   - If you have the javacomplete plugin correctly installed then you should
""     be able to omnicomplete android classes, methods and imports using the
""     Ctrl-X Ctrl-O and Ctrl-X Ctrl-U commands. See :h omnifunc for details.
""   - If you use NeoComplCache or YouCompleteMe then the auto-completion should
""     work automatically.
"
Bundle 'hsanson/vim-android'
let g:android_sdk_path="/home/ryujin/Apps/android-studio/sdk"
let g:gradle_path="/home/ryujin/Apps/gradle-1.6"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vimproc
""
"" Description:
""  Asynchronous execution library for Vim. Nice tool to write plugins that do
""  not hang Vim interface when executing.
""
"" Installation:
""  - Install plugin using pathogen or vundle.
""  - Compile the runtime library for your platform. For Ubuntu  the command is:
""
""    cd ~/.vim/bundle/vimproc
""    make -f make_unix.mak
""
""    Make sure you have gcc and make tools to compile:
""
""    sudo apt-get install build-essentials
"
Bundle 'Shougo/vimproc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VimShell
""
"" Description:
""  Simple but powerfull shell that runs inside vim. Can be used to execute
""  commands, browse files, etc. The nice thing is this shell works in windows
""  platforms that do not have a nice shell to work with.
""
"" Installation:
""  - Install plugin via pathogen or vundle
""  - This plugin requires vimproc so make sure it is installed and running.
""
"" Usage:
""  Call :VimShell to get an interactive shell where you can input commands.
Bundle 'Shougo/vimshell'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LogCat plugin
""
"" Description:
""  Opens a vim buffer with the adb logcat output with syntax highlighting. Good
""  for developing and testing Android applications.
""
"" Installation:
""  - Install the plugin via pathogen or vundle
""  - Install android-sdk and ensure adb tool is in your PATH
""  - Install vimproc and vimshell vim plugins that are required dependencies.
""
"" Usage:
""  Execute :Logcat command to open a vim pane with the logcat output.
"Bundle 'thinca/vim-logcat'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Ack Plugin
""
"" Description:
""  This plugin allows search of your code files using grep, ack or ag depending
""  on which one is installed. It gives priority to ag, then ack and finally
""  grep.
""
"" Installation:
""  If you want to use ack for searching make sure you install the ack-grep
""  package in your box. If you prefer ag (a.k.a Silver Searcher) then install
""  the silversearcher-ag package. If you have Ubuntu 13.04 or less then the
""  silversearcher-ag package is not available so to intall follow these steps:
""
""    apt-get install software-properties-common
""    apt-add-repository ppa:mizuno-as/silversearcher-ag
""    apt-get update
""    apt-get install silversearcher-ag
""
"" Usage:
""  - :Ack [options] {pattern} [{directory}]
""
"" Keyboard Shortcuts:
""  o    to open (same as enter)
""  go   to preview file (open but maintain focus on ack.vim results)
""  t    to open in new tab
""  T    to open in new tab silently
""  v    to open in vertical split
""  gv   to open in vertical split silently
""  q    to close the quickfix window
""
"" Resources:
""   http://betterthangrep.com/
""   http://amaslov.wordpress.com/2009/04/23/vim-ack-instead-of-grep/
""   https://github.com/ggreer/the_silver_searcher

Bundle 'mileszs/ack.vim.git'
if executable("ag")
  let g:ackprg="ag --nogroup --nocolor --column"
elseif executable("ack-grep")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  set grepprg=ack-grep\ -H\ --nocolor\ --nogroup\ --column\ $*
else
  setlocal grepprg=grep\ -nH\ $*
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NERDTree Plugin
""
"" Description:
""  The all powerful file explorer plugin for vim.
""
"" Usage:
""  :NERDTreeToggle
""

Bundle 'scrooloose/nerdtree.git'

" Set the window width
let g:NERDTreeWinSize = 40
" Set the window position
let g:NERDTreeWinPos = "left"
" Colorful
let g:NERDChristmasTree = 1
let g:NERDTreeHighlightCursorline = 1
" Auto centre
let g:NERDTreeAutoCenter = 0
" Not Highlight the cursor line
let g:NERDTreeHighlightCursorline = 0
" Don't change working directory when opening files
set noautochdir
let g:NERDTreeChDirMode = 2
" Show bookmarks list
let g:NERDTreeShowBookmarks = 1
" Close NERDTree after opening a file
let g:NERDTreeQuitOnOpen = 0
" Ignore files
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
" Quick toogle tree
nmap <silent> <leader>p :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" YouCompleteMe Plugin
""
"" Description:
""  New kid in the block on auto-completion goodness.
""  I am still not sure which is better: NeoComplete or YouCompleteMe. Make
""  you own judgement.
""
"" Installation:
""  - sudo apt-get install cmake python-dev
""  - install YouCompleteMe plugin via Vundle.
""  - cd ~/.vim/bundle/YouCompleteMe
""  - ./install.sh --clang-completer
Bundle 'Valloric/YouCompleteMe.git'
"let g:ycm_filetype_specific_completion_to_disable = {'java': 0 }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NeoComplete
""
"" Description:
""  Auto-completion plugin based on NeoComplCache but written in lua. It is
""  supposed to be faster than NeoComplCache.
""
"" Notes:
""   Requires a current version of vim (> 7.3) with lua interpreter enabled.
""   I am still not sure which is better: NeoComplete or YouCompleteMe. Make
""   sure you try both and make your own judgement.
"Bundle "Shougo/neocomplete.vim"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#smart_close_popup() . "\<CR>"
"endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" EasyTags Plugin
""
"" Description:
""  Auto generate ctags for edited files.
""
"" Note:
""  Disabled because it hangs the vim process from time to time. Need to find a
""  way to run the ctag process asynchronously.
""
" Bundle 'xolox/easytags.git'
set complete=.,w,b,u,t
set tags=.tags
let g:easytags_by_filetype = '~/.vim/tags'
let g:easytags_dynamic_files = 1
let g:easytags_include_members = 1
let g:easytags_resolve_links = 1
let g:easytags_python_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VOoM Plugin
"" 
"" Description:
""  Nice two-pane outliner. It differs from Notes and vimoutliner in that it
""  does not tries to create a new file type. VOoM instead supports several already
""  existing file types such as latex, markdown, org, etc.
""
"" Usage:
""  With a buffer opened run :Voom to open the outline navigation pane.
"
Bundle 'vim-scripts/VOoM.git'
let g:voom_tree_width=60
let g:voom_ft_modes = { 'markdown': 'markdown', 'pandoc': 'markdown', 'tex': 'latex' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" tGPG Plugin
""
"" Description:
""  tGPG Plugin for transparent editing of encrypted files. This is the only
""  plugin for handling encrypted GPG files that worked out of the box.
""
"Bundle 'tomtom/tgpg_vim.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TagBar Plugin and Ruby omnicomplete plugin
""
"" Description:
""  Tlist replacement with scoping.
""
"" Resources:
""  https://github.com/majutsushi/tagbar/wiki

Bundle 'majutsushi/tagbar'

"" Add go support to tagbar. Note this only works on Ubuntu or with
"" exuberant-tags patched with go support.
let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \'p:package',
        \'f:function',
        \'v:variables',
        \'t:type',
        \'c:const'
    \]
\}

"" Markdown support. Note this requires some modifications to your ~/.ctags
"" file. Check the TagBar wiki for more info.
let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ]
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Ruby omnicomplete plugin
""
"" Description:
""  Add omnifunction for auto-completion of ruby/rails code.
""
"" Install:
""  - Install plugin using pathogen or vundle
""  - Modify or create a ftplugin file (e.g. ftplugin/ruby.vim) that contains:
""
""    let g:rubycomplete_buffer_loading = 1
""    let g:rubycomplete_rails = 1
""    let g:rubycomplete_classes_in_global = 1
""    setlocal omnifunc=rubycomplete#Complete
""
Bundle 'vim-scripts/rubycomplete.vim.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Coffee Script Plugin
""
"" Description:
""  Add features to edit coffee script files in Vim.
"
Bundle 'kchmck/vim-coffee-script.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Puppet
"
" Description
"   Syntax and tools for puppet file editing.
Bundle "rodjek/vim-puppet"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go Plugin
"
" Description:
"   Nice plugin with all we need to comfortably develop Go apps in vim
"
" Intallation:
"   To get auto-completion make sure you have gocode installed
"
"     go get -u github.com/nsf/gocode
"
Bundle "fsouza/go.vim"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tim Pope Amazing Plugins
"
" Description:
"   Lots of goodies
"
" Usage:
"   Too much information. Refer to each plugin git repo:
"   https://github.com/tpope?tab=repositories
"
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'tpope/vim-vividchalk.git'
Bundle 'tpope/vim-haml.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-speeddating'

Bundle 'Raimondi/delimitMate'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Surround Plugin
""
"" Description:
""  Plugin for deleting, changing, and adding surroundings.
""
"" Usage:
""  Old text                  Command     New text ~
""  Hello *world!"            ds"         Hello world!
""  [123+4*56]/2              cs])        (123+456)/2
""  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
""  if *x>3 {                 ysW(        if ( x>3 ) {
""  my $str = *whee!;         vlllls'     my $str = 'whee!';
""
Bundle 'tpope/vim-surround.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Matchit Plugin
""
"" Description:
""  Allows you to configure % to match more than just single characters.
""
Bundle 'vim-scripts/matchit.zip'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim-preview Plugin
""
"" Description:
""  Allows to generate and preview HTML documents in a browser.
""
"" Installation:
""  - Install plugin via pathogen or vundle.
""  - Install the following gems:
""
""    sudo gem install RedCloth github-markup bluecloth redcarpet
""
"" Usage:
""  <leader>P will process markdown, textile, rdoc and html files and load them
""  in a browser.
""
Bundle 'greyblake/vim-preview.git'
let g:PreviewBrowsers = 'chromium-browser,firefox,rekonq'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YankRing Plugin
" 
" Description:
"  Facilitates the handling of yanked text in registers.
let g:yankring_replace_n_pkey = '<C-j>'
let g:yankring_replace_n_nkey = '<C-k>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Amazing nice plugin to work with Databases
"
" Description:
"   This is an amazing plugin that allows you to work with SQL databases within
"   vim. You can write queries in a buffer and execute them on your databases
"   getting the results in a split window.
"
" Installation:
"   Depending on the database you wish to use you may need to install different
"   SQL client tools:
"
"   - MySQL install unixodbc package
"   - PostgresSQL install postgresql-client-common
"   - Sqlite install sqlite3
"
" Usage:
"
"  - Create a connection profile for each DB you want to connect. For this add a
"    line like below to your vimrc:
"
"    let g:dbext_default_profile_<name>='type=MYSQL:user=<user>:passwd=<pass>:dbname=<dbname>:extra=--batch --raw --silent -t'
"
"    replace the <name>, <user>, <pass> and <dbname> with your connection
"    parameters and then in a vim buffer run :DBPromptForBufferParameters to
"    select the profile you want to use.
"
"  - With the profiles in place you can open any vim buffer and connect to the
"    database using:
"
"    :DBPromptForBufferParameters or <leader>sbp
"
"  - You can also add a profile comment at the top of a file so the connection
"    is establish when you open it:
"
"    // dbext:profile=<name>
"
"  - Use the following commands to execute queries on the dabatase:
"
"    - <leader>se  - SQL Execute (use this if the query expands multiple lines)
"    - <leader>sel - SQL Execute current line.
"    - <leader>st  - Select everything from table under cursor
"    - <leader>sT  - Same as st but it will prompt you to input a limit value.
"    - <leader>std - Describe table under cursor
"    - <leader>slt - List tables in the database
"    - <leader>slc - Add list of columns of table under cursor to the copy register.
"    - <leader>sdp - Show stored procedures
"
Bundle 'krisajenkins/dbext.vim'
let  g:dbext_default_history_file = '$HOME/.dbext_sql_history.txt'
let  g:dbext_default_history_size = 1000

" If you share your vim configuration files make sure you keep your database
" profiles in a separate file. We don't want to share all our databases IP
" addreses, user and passwords.
source ~/.dbext_profiles

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp Plugin
" 
" Description:
"   Amazing fuzzy finder. Better than command-t and without all the ruby
"   dependencies.
"
" Usage:
"   <C-P> to start search mode.
"   <C-T> to open selected file in new tab
"   <C-v> to open selected file in vertical split
"
Bundle 'kien/ctrlp.vim.git'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_dotfiles=1
let g:ctrlp_reuse_window='netrw\|help\|quickfix'
let g:ctrl_use_caching=1
let g:ctrl_clear_cache_on_exit=0
let g:ctrl_mruf_case_sensitive=0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=vendor/rails/**
set wildignore+=public/**
set wildignore+=*.jar,*.class

"let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|build|\.idea|bin)$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'current',
  \ }

let g:ctrlp_extensions = ['tag']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Instant-Markdown plugin
""
"" Description:
""   Allows almost realtime preview of markdown documents.
""
"" Installation:
""
""   sudo gem install redcarpet pygments.rb
""   sudo apt-get install npm build-essential g++ automake
""   sudo npm -g install instant-markdown-d
""
"" Usage:
""   Open a markdown file and a browser will automatically pop-up with a
""   real-time preview of the markdown.
""
"" Note:
""  Disabled because is unstable and somtimes works and sometimes doesn't. Seems
""  the node.js process dies or cannot start on some situations.
"
"Bundle 'suan/vim-instant-markdown.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" DrawIt Plugin
""
"" Description:
""  Nice plugin to create ascii diagrams on text files.
""
"" Usage:
""  Very complex so read the help or go to the plugin page.
""  https://github.com/vim-scripts/DrawIt
Bundle 'vim-scripts/DrawIt.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-sudo plugin
""
"" Description:
""  Allow editing files as sudo without running the whole vim process as root.
""
"" Usage:
""  vim sudo:/etc/passwd   (from terminal)
""  :e sudo:/etc/passwd    (within vim)
"
Bundle 'vim-scripts/sudo.vim.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Look and Feel Settings
""
"" Prerequisites:
""  - Make sure your terminal supports 256 colors. Konsole does but you must set
""    the TERM variable to xterm-256color in the schema properties.
""

" Stop the terminal bg color to bleed into our favorite color scheme.
" http://snk.tuxfamily.org/log/vim-256color-bce.html
set term=screen-256color

" Enable syntax
syntax on sync minlines=256
set t_Co=256                          " Enable 256 color mode in terminal.
set background=dark                   " I like dark backgrounds.

" Install nice colorschemes
Bundle 'w0ng/vim-hybrid.git'
Bundle 'lsdr/monokai'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized.git'
Bundle '29decibel/codeschool-vim-theme'
Bundle 'oguzbilgic/sexy-railscasts-theme'
Bundle 'davidkariuki/sexy-railscasts-256-theme'
Bundle 'zeis/vim-kolor'
Bundle 'chrisbra/color_highlight'

" Solarized color scheme configuration
let g:solarized_termcolors=256
let g:solarized_termtrans = 1

" Molokai color scheme configuration
let g:rehash256 = 1

colors molokai
"colors sexy-railscasts-256
"colors solarized

" Apply some color to the popup menu used for auto-completion.
highlight Pmenu ctermbg=203 gui=bold

" Show tabs and tailing spaces.
" Note: to insert the middle point press "ctrl+k .M" in insert mode. Tha is
" control + k followed by a <dot> and the capital M.
set list
"set listchars=tab:»·,trail:·,nbsp:·
"set listchars=tab:▸\ ,trail:·,nbsp:·
exec "set lcs=tab:\uBB\uBB,trail:\uB7,nbsp:~"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Filetype Settings
""
"" Description:
""  For each filetype we create a ftplugin/<filetype>.vim file with settings
""  particular to each filetype. For example we set tabs instead of spaces for
""  python and makefile files and enable the different omnifunctions for each
""  filetype that supports it.
""
"" Installation:
""
""  Refer to the ftplugin folder and edit the files there to your needs or add
""  new file types if required.
""
filetype plugin indent on " Re-enable after pathogen is loaded.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_airline status line
"
set laststatus=2
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1

" Uncomment the following statusline option if you do not use vim_airline
" if exists('g:loaded_fugitive') || &cp
"   set statusline=%{fugitive#statusline()}
" endif
" set statusline+=[%f]%=0x%B\ \ \ [%(%l/%L,%c%V%)]\ \ (%p%%)
