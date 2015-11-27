"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Description:
""  My always evolving vim configuration. Note that I have switched to neovim so
""  some configuration/plugins may work only with neovim.
""
"" Dependencies:
""
""  Some plugins and configurations require some tools to be installed before
""  they can be used. In a Ubuntu/Debian computer you can easily install them
""  with the following command:
""
""    sudo apt-get install xsel build-essentials openjdk-7-jdk cmake g++
""      \ pkg-config unzip automake autoconf libtool-bin
""
"" Usage:
""
""  - Install NeoBundle
""
""    mkdir -p ~/.vim/bundle
""    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
""
""  - Start vim and install all bundles.
""
""  - Carefully read the vimrc file and add the parts you like to your own vimrc
""    configuration. Do not copy all this configuration on you home and expect
""    everything to work on one try.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NeoBundle Plugin
""
"" Description:
""  Nice vim plugin manager.
""
"" Usage:
""
""  Define your plugins using the Bundle command. After that we have some
""  commands to handle the plugins.
""
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.fzf
endif

filetype off
filetype plugin indent off

call neobundle#begin(expand('~/.config/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Personal plugins
NeoBundle 'hsanson/vim-projtags'
NeoBundle 'hsanson/vim-resize'

NeoBundle 'hsanson/vim-android'
NeoBundle 'hsanson/vim-im'

" Helper and tools
NeoBundle "yuratomo/dbg.vim"
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle "fatih/vim-go"
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'gregsexton/gitv'
NeoBundle 'jreybert/vimagit'
"NeoBundle 'thinca/vim-logcat'
NeoBundle 'cohama/lexima.vim'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'krisajenkins/dbext.vim'
NeoBundle 'vim-scripts/DrawIt.git'

" Text object add ons
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'rbonvall/vim-textobj-latex'

" Visual aid and eyecandy
NeoBundle 'bling/vim-airline'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'koron/nyancat-vim'
NeoBundle "Yggdroot/indentLine"

" Colorschemes
NeoBundle "NLKNguyen/papercolor-theme"
NeoBundle 'zeis/vim-kolor'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'ajh17/Spacegray.vim'

" Syntax and language support
NeoBundle 'slim-template/vim-slim.git'
NeoBundle 'vim-scripts/groovy.vim'
NeoBundle 'kchmck/vim-coffee-script.git'
NeoBundle "rodjek/vim-puppet"
NeoBundle 'tpope/vim-haml.git'
NeoBundle 'othree/yajs.vim'
NeoBundle 'pearofducks/ansible-vim'

" Highlights color codes with the actual color.
NeoBundle 'chrisbra/color_highlight'

" Document editing
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'vim-scripts/VOoM.git'
NeoBundle 'vim-pandoc/vim-pandoc'
NeoBundle 'vim-pandoc/vim-pandoc-syntax'
NeoBundle 'vim-pandoc/vim-pandoc-after'

" Auto completion

NeoBundle 'Valloric/YouCompleteMe.git', {
    \ 'build': {
    \   'unix' : './install.sh --clang-completer --system-libclang --omnisharp-completer'
    \ }}
"NeoBundle "Shougo/neocomplete.vim"

NeoBundle 'artur-shaik/vim-javacomplete2'
"NeoBundle 'vim-scripts/javacomplete'
"NeoBundle 'nwertzberger/javacomplete'
"NeoBundle 'itszero/javacomplete'
"NeoBundle 'adragomir/javacomplete'
"NeoBundle 'Shougo/javacomplete'
"NeoBundle 'vim-scripts/javaimports.vim'

"NeoBundle 'vim-scripts/rubycomplete.vim.git'
NeoBundle '1995eaton/vim-better-css-completion'
NeoBundle '1995eaton/vim-better-javascript-completion'

" Code navigation
NeoBundle 'mileszs/ack.vim.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'hewes/unite-gtags'
"NeoBundle 'majutsushi/tagbar'
"NeoBundle 'ludovicchabant/vim-gutentags'
NeoBundle 'vim-scripts/gtags.vim'

NeoBundleCheck
call neobundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set bs=2                              " Sane backspace behavior.
set fileformats=unix,dos              " Use unix file format.
set number                            " Show line number column.
set nobackup                          " Stop vim from creating ~ files.
set nojoinspaces                      " Avoid double spaces when joining lines
set showcmd                           " Display commands as they are typed.
set showmatch                         " Show briefly matching bracket when closing it.
set scrolloff=9999                    " Always keep the cursor at the center of window.
set lazyredraw                        " Improve performance
"set hidden                           " Allow change buffer without saving.
set nofoldenable                      " Disable folding that slows down auto-completion
set nrformats=                        " Stop vim from treating zero padded numbers as octal
"set foldlevelstart=99
"let loaded_matchparen = 1            " Disable matchparent that is annoying.
set cursorline                        " Highlight current line in Insert Mode.
set cursorcolumn                      " Highlight current column in Insert Mode.
set switchbuf=useopen,usetab
set clipboard+=unnamedplus            " Use + and * registers by default.

" Quicker than reaching ESC for exiting insert mode.
inoremap jk <ESC>
inoremap kj <ESC>

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
"" Look and Feel Settings
""

" Enable syntax
syntax on sync minlines=256
"set synmaxcol=200                     " Improve scroll performance with long lines
set background=dark                    " I like dark backgrounds.

" Force all colorschemes to have transparent background. Affects only 256 mode.
au ColorScheme * hi Normal ctermbg=NONE

" Make cursorline transparent too so only the line number is highlighted on the
" current line.
au ColorScheme * hi CursorLine ctermbg=NONE

colors PaperColor

" Apply some color to the popup menu used for auto-completion.
highlight Pmenu ctermbg=203 gui=bold

" Show tabs and tailing spaces.
" Note: to insert the middle point press "ctrl+k .M" in insert mode. Tha is
" control + k followed by a <dot> and the capital M.
set list
exec "set lcs=tab:\uBB\uBB,trail:\uB7,nbsp:~"

" Highlight color codes with the actual color. Requires color_highlight plugin.
let g:colorizer_auto_filetype='css,html'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_airline status line
"
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='PaperColor'

" Uncomment the following statusline option if you do not use vim_airline
" if exists('g:loaded_fugitive') || &cp
"   set statusline=%{fugitive#statusline()}
" endif
" set statusline+=[%f]%=0x%B\ \ \ [%(%l/%L,%c%V%)]\ \ (%p%%)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                          " Highlight search results.
set incsearch
set ignorecase
set smartcase

" Set search path for gf command
set path=/usr/include,/usr/local/include,**;$HOME

" Move swap files out of the current directory. This is useful to avoid swp
" files from accidentally entering your git repos or to avoid them being sync
" when editing a file in a dropbox/ubuntuone folder.
set directory=/var/tmp//,/tmp//

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Improve undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undolevels=10000
if has("persistent_undo")
  set undodir=/var/tmp//,/tmp//
  set undofile
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Force write with sudo.
cmap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map make for easy access
" map <F5> <ESC>:silent! make<CR><C-l>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Improve QuickFix Window

" Tip: http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
" Automatically open the quickfix window on :make or close it when it has become
" empty.
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

" Move the quickfix window to the bottom of the vim window.
"autocmd FileType qf wincmd J

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ProjTags Plugin

let g:projtags_list = {
      \ 'java7': ['/home/ryujin/Apps/jdk/src'],
      \ 'android': [
      \     '~/vault/java/otto',
      \     '~/vault/java/google-gson-read-only',
      \     '~/vault/java/realm-java',
      \     '~/vault/java/retrofit',
      \     '~/vault/java/couchbase-lite-android',
      \     '~/Apps/android-sdk/sources/android-21'
      \ ],
      \ 'kernel': ['/usr/src/linux-kbuild-3.1']
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Buffer and Tab navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easily switch between open tabs
nnoremap <TAB> :tabnext<CR>
nnoremap <S-TAB> :tabprev<CR>

" Enables more fluid resizing of split windows
nnoremap <C-UP> :ResizeUp<CR>
nnoremap <C-DOWN> :ResizeDown<CR>
nnoremap <C-LEFT> :ResizeLeft<CR>
nnoremap <C-RIGHT> :ResizeRight<CR>

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

" Allow navigation in the select popup using C-j and C-k
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"

set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.db,*.swc,*.rbc " Binary objects
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                    " Temp files
set wildignore+=vendor/rails/**,vendor/gems/**              " Rails stuff
set wildignore+=public/**                                   " Web dev stuff
set wildignore+=*.jar,*.class,*.log,*.gz                    " Java bin files
set wildignore+=.git,*.rbc,*.svn
set wildignore+=*.jpeg,*.jpg,*.jpeg*,*.png,*.gif            " Media files
set wildignore+=*/log/*,*/.bundle/*,*/bin/*,*/tmp/*,*/build/*
set wildignore+=*/.sass-cache/*

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
"nnoremap <expr> k v:count == 0 ? 'gk' : 'k'  " Enable navigation within long lines (up)
"nnoremap <expr> j v:count == 0 ? 'gj' : 'j'  " Enable navigation within long lines (down)

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
"" vim-easy-align Plugin
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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
let g:android_sdk_path="/home/ryujin/Apps/android-sdk"
let g:gradle_path="/home/ryujin/Apps/gradle"

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
""  If you have debian 8 or Ubuntu 14.04 and latter then ag is already packaged
""  in the official repo:
""
""    apt-get install silversearcher-ag
""
""  When using ag make sure you create a .agignore file inside you project with
""  ignore patterns. Using the default .gitignore has issues, at least in my
""  case where the search is not recursive.
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

if executable("ag")
  " Without -U option search does not work on my setting.
  let g:ackprg="ag -U -i --vimgrep $*"
elseif executable("ack")
  let g:ackprg="ack -H --nocolor --nogroup --column --sort-files --ignore-file=is:.tags "
elseif executable("ack-grep")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-file=is:.tags "
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
let g:ycm_filetype_specific_completion_to_disable = {'ruby': 0, 'java': 0}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-javacomplete2 Plugin
""
let g:JavaComplete_Home = $HOME . '/.vim/bundle/vim-javacomplete2'
let $CLASSPATH .= '.:' . $HOME . '/.vim/bundle/vim-javacomplete2/libs/javavi/target/classes'
let g:JavaComplete_JvmLauncher = $HOME . '/Apps/jdk1.8.0_45/bin/java'
let g:JavaComplete_JavaCompiler = $HOME . '/Apps/jdk1.8.0_45/bin/javac'

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
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#smart_close_popup() . "\<CR>"
"endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gutentags
"
" Description:
"   So far the best tag auto generation plugin I have user. Does not seem to
"   block vim like szw/vim-tags or xolox/easytags.git did.
"
let g:gutentags_tagfile = '.tags'
let g:gutentags_background_update = 1
let g:gutentags_cache_dir = '/home/ryujin/.vim/tags'
let g:gutentags_exclude = [
      \ '*.min.js',
      \ '*html*',
      \ 'jquery*.js',
      \ '*/vendor/*',
      \ '*/node_modules/*',
      \ '*/migrate/*.rb'
      \ ]
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_write = 0
let g:gutentags_generate_on_new = 0
nnoremap <leader>gt :GutentagsUpdate!<CR>

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
let g:voom_tree_width=60
let g:voom_ft_modes = { 'markdown': 'markdown', 'pandoc': 'markdown', 'tex': 'latex' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TagBar Plugin and Ruby omnicomplete plugin
""
"" Description:
""  Tlist replacement with scoping.
""
"" Resources:
""  https://github.com/majutsushi/tagbar/wiki

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
let g:go_fmt_autosave = 0

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
let  g:dbext_default_history_file = '$HOME/.dbext_sql_history.txt'
let  g:dbext_default_history_size = 1000

" If you share your vim configuration files make sure you keep your database
" profiles in a separate file. We don't want to share all our databases IP
" addreses, user and passwords.
source ~/.dbext_profiles

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite Plugin
"
" To use the gtags plugin you need to install GNU global tool:
"
"   wget http://tamacom.com/global/global-6.5.1.tar.gz
"   tar xvfz global-6.5.1.tar.gz
"   cd global-6.5.1
"   ./configure --prefix=/usr
"   make && sudo make install
"
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_prompt='» '
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_file=5000

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack-grep')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
  let g:unite_source_grep_recursive_opt=''
endif

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  nmap <buffer> Q <plug>(unite_exit)
  nmap <buffer> <esc> <plug>(unite_exit)
  imap <buffer> <esc> <plug>(unite_exit)
endfunction

nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files -start-insert file file_mru file_rec/async:!<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files gtags/def gtags/ref<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF Plugin
"
" Description:
"   Faster fuzzy finder alternative to ctrl-p. The best part is that this is a
"   terminal tool so fuzzy searching is not limited to vim only. It works for
"   files etc in the terminal too. Also configuration is far easier.
"
" Installation:
"   You need to install fzf tool first on your machine for this to work:
"
"     git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
"     ~/.fzf/install
"
"   then add this line to your vimrc, nvimrc or init.vim:
"
"     set rtp+=~/.fzf
"
" Usage:
"
"   :FZF Search on current directory
"   :FZF Search on home directory
"   :FZF --no-sort -m /tmp  Search with paramters
"   :FZF! Search in full screen or neovim split.
nnoremap <C-p> :FZF<ENTER>

