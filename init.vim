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
""      \ pkg-config unzip automake autoconf libtool-bin ranger
""
"" Usage:
""
""  - Install Plug
""
""    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
""       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""
""  - Start vim and install all bundles.
""
""  - Carefully read the vimrc file and add the parts you like to your own vimrc
""    configuration. Do not copy all this configuration on you home and expect
""    everything to work on one try.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins
""
call plug#begin('~/.config/nvim/bundle')

" Personal plugins
Plug '~/Projects/vim/vim-android'
Plug '~/Projects/vim/vim-projtags'
Plug '~/Projects/vim/vim-resize'
Plug '~/Projects/vim/vim-im'

" Helper and tools
Plug 'yuratomo/dbg.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/vimshell'
Plug 'junegunn/vim-easy-align'
Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-dispatch'
Plug 'gregsexton/gitv'
Plug 'jreybert/vimagit'
"Plug 'thinca/vim-logcat'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/DrawIt'
Plug 'dbakker/vim-projectroot'
Plug 'kassio/neoterm'

" Text object add ons
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-function'
Plug 'rbonvall/vim-textobj-latex'

" Visual aid and eyecandy
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'koron/nyancat-vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/yaml.vim'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'zeis/vim-kolor'
Plug 'ajh17/Spacegray.vim'
Plug 'rakr/vim-one'

" Syntax and language support
Plug 'slim-template/vim-slim'
Plug 'vim-scripts/groovy.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-haml'
Plug 'othree/yajs.vim'
Plug 'pearofducks/ansible-vim'

" Highlights color codes with the actual color.
Plug 'chrisbra/color_highlight'

" Document editing
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'vim-scripts/VOoM'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'

" Database Connector
Plug 'krisajenkins/dbext.vim'

" Auto completion

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'artur-shaik/vim-javacomplete2'
Plug 'osyo-manga/vim-monster'

"Plug 'vim-scripts/javacomplete'
"Plug 'nwertzberger/javacomplete'
"Plug 'itszero/javacomplete'
"Plug 'adragomir/javacomplete'
"Plug 'Shougo/javacomplete'
"Plug 'vim-scripts/javaimports.vim'

"Plug 'vim-scripts/rubycomplete.vim.git'
Plug '1995eaton/vim-better-css-completion'
Plug '1995eaton/vim-better-javascript-completion'

" Code navigation
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/neomru.vim'
Plug 'yssl/QFEnter'
"Plug 'majutsushi/tagbar'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/gtags.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set bs=2                              " Sane backspace behavior.
set fileformats=unix,dos              " Use unix file format.
set number                            " Show line number column.
set nobackup                          " Stop vim from creating ~ files.
set nowritebackup                     " No backups
set noswapfile                        " More hassel than solution.
set shortmess=atI                     " Avoid unnecessary hit-enter prompts.
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
set laststatus=2
set noequalalways                     " No automatic resizing of windows.
set cursorline                        " highlight current line in insert Mode.
set nocursorcolumn                    " Highlight current column in Insert Mode.
set switchbuf=useopen,usetab
set clipboard+=unnamedplus            " Use + and * registers by default.
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the biggest key as leader
let mapleader = "\<Space>"

" Map frequent actions to leader shortcuts
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :wqa<CR>

" Quicker than reaching ESC for exiting insert mode.
inoremap jj <ESC>
inoremap kk <ESC>
inoremap っｊ <ESC>
inoremap っｋ <ESC>

" Navigate tabs
nnoremap tt  :tabnext<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tn  :tabnew<CR>

" Jump directly to tab number
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 0gt

" Quickfix
nnoremap qk <ESC>:cN<CR>
nnoremap qj <ESC>:cn<CR>

" Neoterm
nnoremap no :Tnew<CR>
nnoremap nc :Tclose<CR>
nnoremap ne :TREPLSendFile<CR>
vnoremap ne :TREPLSend<CR>
nnoremap nm :T make<CR>

" Enables more fluid resizing of split windows
nnoremap <C-UP> :ResizeUp<CR>
nnoremap <C-DOWN> :ResizeDown<CR>
nnoremap <C-LEFT> :ResizeLeft<CR>
nnoremap <C-RIGHT> :ResizeRight<CR>

" vim-easy-align Plugin
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Disable unproductive keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Esc> <NOP>

" Allow moving between splits using leader and hjkl navigation keys
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Allow moving between terminal buffer and normal buffers using leader and hjkl
" navigation keys.
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <Leader>h <C-\><C-n><C-w>h
  tnoremap <Leader>j <C-\><C-n><C-w>j
  tnoremap <Leader>k <C-\><C-n><C-w>k
  tnoremap <Leader>l <C-\><C-n><C-w>l
endif

" Gutentags
nnoremap <leader>gt :GutentagsUpdate!<CR>

" NERDTree
nmap <silent> <leader>p :NERDTreeToggle<CR>
nmap <silent> <leader>f :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoterm plugin
let g:neoterm_size = 20
let g:neoterm_automap_keys = 'tm'
let g:neoterm_test_status = {
      \ 'running': 'RUNNING',
      \ 'success': 'SUCCESS',
      \ 'failed': 'FAILED' }
let g:neoterm_repl_python='ipython3'
let g:neoterm_repl_ruby='pry'

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

" Enable true color support in NEOVIM
if has('termguicolors')
  set termguicolors
endif

"set synmaxcol=200                     " Improve scroll performance with long lines
set background=dark                    " I like dark backgrounds.

augroup SyntaxGroup
  autocmd!
  " Force all colorschemes to have transparent background.
  au ColorScheme * hi Normal guibg=NONE ctermbg=NONE
  " Make cursorline transparent too so only the line number is highlighted on the
  " current line.
  au ColorScheme * hi CursorLine guibg=NONE ctermbg=NONE
augroup END

let g:one_allow_italics = 1
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
" lightline status line
"
let g:lightline = {
  \ 'colorcheme': 'PaperColor',
  \ 'active': {
  \    'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
  \    'right': [ ['lineinfo'], ['percent'], ['gradle'] ]
  \ },
  \ 'inactive': {
  \    'left': [ [ 'filename' ] ],
  \    'right': [ ['lineinfo'], ['percent'], ['gradle'] ]
  \ },
  \ 'component': {
  \    'readonly': '%{&readonly?"":""}',
  \    'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
  \    'gradle': '%{exists("*gradle#statusLine")?gradle#statusLine():""}'
  \    },
  \ 'component_visible_condition': {
  \    'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
  \    'gradle': '(exists("*gradle#statusLine") && ""!=gradle#statusLine())'
  \    }
  \ }

let g:gradle_glyph_error=''
let g:gradle_glyph_warning=''
let g:gradle_glyph_gradle=''
let g:gradle_glyph_android=''
let g:gradle_glyph_building=''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                          " Highlight search results.
set incsearch
set ignorecase
set nosmartcase

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
" Improve QuickFix Window

" Tip: http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
" Automatically open the quickfix window on :make or close it when it has become
" empty.
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

" Move the quickfix window to the bottom of the vim window.
"autocmd FileType qf wincmd J

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

set wildignore+=*.o,*.obj,*.pyc,*.pyo,*.DS_STORE,*.db,*.swc,*.rbc " Binary objects
set wildignore+=__pycache__
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                    " Temp files
set wildignore+=vendor/rails/**,vendor/gems/**              " Rails stuff
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
" and enable the options below (Vim Tip #989). See ftplugin/markdown.vim for
" usage example.

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
let g:gradle_daemon=1
let g:netrw_browsex_viewer="google-chrome"

augroup GradleGroup
  autocmd!
  au BufWrite build.gradle call gradle#sync()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" QFEnter Plugin
""
let g:qfenter_open_map = [ '<CR>', '<2-LeftMouse>' ]
let g:qfenter_vopen_map = [ '<C-v>' ]
let g:qfenter_hopen_map = [ '<C-x>' ]
let g:qfenter_topen_map = [ '<C-t>' ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Ag Plugin
""
"" Description:
""  This plugin allows search of your code files using Silver Searcher (Ag)
""  tool.
""
"" Installation:
""  Install the silversearcher-ag package. If you have Ubuntu 13.04 or less then the
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
"" Resources:
""   http://betterthangrep.com/
""   http://amaslov.wordpress.com/2009/04/23/vim-ack-instead-of-grep/
""   https://github.com/ggreer/the_silver_searcher

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Tags Plugin
map <C-]> :Gtags<CR><CR>
map <C-\> :Gtags -r<CR><CR>

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
let g:NERDTreeWinSize               = 40
let g:NERDTreeWinPos                = "left"
let g:NERDChristmasTree             = 1
let g:NERDTreeHighlightCursorline   = 1
let g:NERDTreeAutoCenter            = 0
let g:NERDTreeHighlightCursorline   = 0
let g:NERDTreeShowBookmarks         = 1
let g:NERDTreeQuitOnOpen            = 0
let g:NERDTreeRespectWildIgnore     = 1
let g:NERDTreeAutoDeleteBuffer      = 0
let g:NERDTreeCaseSensitiveSort     = 1
let g:NERDTreeRespectWildIgnore     = 1
let g:NERDTreeCascadeSingleChildDir = 1
let g:NERDTreeCascadeOpenSingleChildDir = 1

" NERDTree to change the current working directory when selecting a root node
let g:NERDTreeChDirMode = 2

" Function moves to the nerdtree buffer if present, updates it using R mapping
" and returns to the previous window. This method was copied from janus vim
" distribution.
function s:UpdateNERDTree(...)
  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      "exe "vertical resize " . g:NERDTreeWinSize
      wincmd p
    endif
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When working on several projects I keep each one in a separate tab. This code
" here sets the tab name automatically to the project root folder name so I know
" what project I am working on each tab.

function! ProjectTabName(n)
  let buflist = tabpagebuflist(a:n)
  let winnr   = tabpagewinnr(a:n)
  let bufnr   = buflist[winnr -1]
  return fnamemodify(projectroot#guess(bufname(bufnr)), ':t') . ''
endfunction

" Sets the tabline using our custom font icons, highlight and NERDTree based tab
" names. See :h setting-tabline for details on how this function works.
function! ProjectTabLine()

  let s = ''

  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " set the tab name
    let s .= ProjectTabName(i + 1)

  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X'
  endif

  return s
endfunction

set tabline=%!ProjectTabLine()

function! ProjectCwdRoot()
  if has('nvim')
    exec ':tch ' . projectroot#guess("%")
  else
    exec ':chdir ' . projectroot#guess("%")
  endif
endfunction

autocmd BufEnter * call ProjectCwdRoot()


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
"" Deoplete Plugin
""
let g:deoplete#enable_at_startup = 1

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.java = [ 'javacomplete#Complete' ]
let g:deoplete#omni#functions.ruby = [ 'monster#omnifunc' ]
let g:deoplete#omni#functions.c = [ 'ccomplete#Complete' ]
let g:deoplete#omni#functions.css = [ 'csscomplete#CompleteCSS' ]

let g:deoplete#sources#omni#input_patterns = {}
let g:deoplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"" vim-monster Plugin (Ruby autocomplete)
let g:monster#completion#rcodetools#backend = "async_rct_complete"

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VOoM Plugin
"" 
"" Description:
""  Nice two-pane outliner. It differs from Notes and vimoutliner in that it
""  does not tries to create a new file type. VOoM instead supports several already
""  existing file types such as latex, markdown, org, etc.
""
"" Usage:
""
""  :Voom or :VoomToggle to open the outline tree
""
""  Inside the outline tree:
""
""    i  Jump to the title in the edit buffer
""    I  Jump to the end of the section in the edit buffer
""    aa Add new section at the same level of current node.
""    AA Add child section to the current node.
""    R  Move to buffer and visually select all test of the node.
""    ^^ Move node up.
""    __ Move node down.
""    << Move nodes to parent level
""    >> Move nodes to child level
""    yy Copy whole node text to "+ register
""    dd Cut node contents and copy to "+ register
""    pp Paste nodes from "+ register after current node or fold

let g:voom_tree_placement="right"
let g:voom_tree_width=30
let g:voom_ft_modes = {
      \ 'markdown': 'markdown',
      \ 'pandoc':   'markdown',
      \ 'tex':      'latex',
      \ 'asciidoc': 'asciidoc'
      \ }

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
" FZF Plugin
"
" Description:
"   Faster fuzzy finder alternative to ctrl-p. The best part is that this is a
"   terminal tool so fuzzy searching is not limited to vim only. It works for
"   files etc in the terminal too. Also configuration is far easier.
"
nnoremap <C-p> :Files<ENTER>

