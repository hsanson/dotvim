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
""    sudo apt-get install xsel build-essentials openjdk-7-jdk cmake g++ \
""      pkg-config unzip automake autoconf libtool-bin ranger \
""      silversearcher-ag jq zathura python3-pip python2-pip libncurses5-dev \
""      xsel
""
""    pip3 install --user neovim-remote neovim
""    pip2 install --user neovim-remote neovim
""
""  Install optional ALE linters and tools:
""
""    sudo apt-get install shellcheck chktex lacheck nodejs ruby2.5 python3-pip
""    pip3 install --user python-language-server jedi proselint autopep8 \
""         flake8 pyflakes rope pycodestyle pydocstyle yapf yamllint
""    sudo gem install solargraph rubocop sqlint
""    sudo npm install --global prettier vue-language-server \
""         javascript-typescript-langserver write-good
""
""    Java Language Server
""
""      # Only compiles with java8 (update-java-alternatives)
""      git clone https://github.com/georgewfraser/vscode-javac.git
""      cd vscode-javac
""      sudo apt-get install maven
""      mvn package
""      cp out/fat-jar.jar $VIMHOME/tools/javacs.jar
""
""    Kotlin Language Server
""
""       # Only works with java8 (update-java-alternatives)
""       git clone https://github.com/fwcd/KotlinLanguageServer.git
""       cd KotlinLanguageServer.git
""       ./gradlew build -x test
""       cp -rf build/install/kotlin-language-server ~/.config/nvim/tools/
""
""    Ktlint
""
""       curl -sSLO https://github.com/shyiko/ktlint/releases/download/0.24.0/ktlint
""       chmod a+x ktlint
""       sudo mv ktlint /usr/local/bin/
""
"" Usage:
""
""  - Install Plug
""
""    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
""       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""
""  - Start vim and install all bundles by running :PlugInstall
""
""  - Carefully read the vimrc file and add the parts you like to your own vimrc
""    configuration. Do not copy all this configuration on you home and expect
""    everything to work on one try.
scriptencoding utf-8

if !has('nvim')
  call ch_logfile(expand('/tmp/chlogfile.log'), 'w')
endif

let g:ale_completion_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins
""
call plug#begin('~/.config/nvim/bundle')

" Personal plugins
" Clone these from https://github.com/hsanson
Plug '~/Projects/vim/vim-android'
Plug '~/Projects/vim/vim-winmode'
Plug '~/Projects/vim/vim-im'

" Helper and tools
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'machakann/vim-sandwich'
Plug '~/Projects/vim/slimux'
Plug 'jeanCarloMachado/vim-toop'

" Text object add ons
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-function'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'doums/darcula'

" Syntax and language support
Plug 'udalov/kotlin-vim'
Plug 'vim-scripts/yaml.vim'
Plug 'chrisbra/color_highlight'
Plug 'posva/vim-vue'
Plug 'neomutt/neomutt.vim'
Plug 'JuliaEditorSupport/julia-vim'

" Document editing
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Linting and Auto completion
Plug '~/Projects/vim/ale'
Plug 'liuchengxu/vista.vim'
Plug 'maximbaz/lightline-ale'
Plug 'sirver/ultisnips'

" Code navigation
Plug 'rafaqz/ranger.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Visual aid and eyecandy
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Vim Plugin Testing
Plug 'junegunn/vader.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=2                       " Sane backspace behavior.
set fileformats=unix,dos              " Use unix file format.
set number                            " Show line number column.
set nobackup                          " Stop vim from creating ~ files.
set nowritebackup                     " No backups
set noswapfile                        " More hassel than solution.
set shortmess=atIc                    " Avoid unnecessary hit-enter prompts.
set nojoinspaces                      " Avoid double spaces when joining lines
set showcmd                           " Display commands as they are typed.
set showmatch                         " Show briefly matching bracket when closing it.
set scrolloff=9999                    " Always keep the cursor at the center of window.
set lazyredraw                        " Improve performance
set nofoldenable                      " Disable folding that slows down auto-completion
set nrformats=                        " Stop vim from treating zero padded numbers as octal
set laststatus=2
set noequalalways                     " No automatic resizing of windows.
set cursorline                        " highlight current line in insert Mode.
set nocursorcolumn                    " Highlight current column in Insert Mode.
set switchbuf=useopen,usetab
set splitbelow
set splitright
set hidden                            " Avoid loosing unsaved work when changing buffers.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Clipboard
""
""  - unnamedplus: system clipboard (Ctrl-v/Ctrl-p)
""  - unnamed:     paste clipboard (Linux/Unix only)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard^=unnamed,unnamedplus 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the biggest key as leader
let mapleader = "\<Space>"

" Map frequent actions to leader shortcuts. These are created to match the same
" mappings used in the vim-winmode plugin.
nnoremap <Leader>s :split<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>x :close!<CR>
nnoremap <Leader>X :wqa!<CR>

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

" WinMode
nmap <leader>w <Plug>WinModeStart

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Slimux plugin
let g:slimux_select_from_current_window = 1
let g:slimux_pane_format = '#(~/.tmux/wname #W)'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toop + Slimux collaboration
"
" <leader>sG   Send all text from cursor to end of file.
" <leader>sGG  Send all text from cursor to start of file.
" <leader>s$   Send all text from cursor to end of line.
" <leader>s<motion> Send text from cursor to end of motion.
call toop#mapFunction('SlimuxSendCode', '<leader>s')

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
  au ColorScheme * hi EndOfBuffer guibg=NONE ctermbg=NONE
  " Make cursorline transparent too so only the line number is highlighted on the
  " current line.
  au ColorScheme * hi CursorLine guibg=NONE ctermbg=NONE term=NONE cterm=NONE
augroup END

let g:one_allow_italics = 1
colors darcula

" Apply some color to the popup menu used for auto-completion.
highlight Pmenu ctermbg=203 gui=bold

if has('nvim')
  set pumblend=20
endif

" Show tabs and tailing spaces.
" Note: to insert the middle point press "ctrl+k .M" in insert mode. Tha is
" control + k followed by a <dot> and the capital M.
set list
exec 'set lcs=tab:\uBB\uBB,trail:\uB7,nbsp:~'

" Highlight japanese space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" Highlight color codes with the actual color. Requires color_highlight plugin.
let g:colorizer_auto_filetype='css,html'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline status line
"

let g:lightline#ale#indicator_checking = ''
let g:lightline#ale#indicator_warnings = ''
let g:lightline#ale#indicator_errors   = ''
let g:lightline#ale#indicator_ok       = ''

let g:lightline = {
  \ 'colorcheme': 'iceberg',
  \ 'active': {
  \    'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
  \    'right': [ ['gradle_project'], ['gradle_running'], ['linter_checking'], ['linter_errors'], ['linter_warnings'], ['linter_ok'], ['lineinfo'], ['percent'] ]
  \ },
  \ 'inactive': {
  \    'left': [ [ 'filename' ] ],
  \    'right': [ ['lineinfo'], ['percent'] ]
  \ },
  \ 'component': {
  \    'readonly': '%{&readonly?"":""}',
  \    'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \    },
  \ 'component_visible_condition': {
  \    'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \    },
  \ 'component_expand': {
  \      'linter_checking': 'lightline#ale#checking',
  \      'linter_warnings': 'lightline#ale#warnings',
  \      'linter_errors': 'lightline#ale#errors',
  \      'linter_ok': 'lightline#ale#ok',
  \      'gradle_errors': 'lightline#gradle#errors',
  \      'gradle_warnings': 'lightline#gradle#warnings',
  \      'gradle_running': 'lightline#gradle#running',
  \      'gradle_project': 'lightline#gradle#project'
  \    },
  \ 'component_type': {
  \      'gradle_erros': 'error',
  \      'gradle_warnings': 'warning',
  \      'gradle_running': 'left',
  \      'gradle_project': 'right',
  \      'linter_checking': 'left',
  \      'linter_warnings': 'warning',
  \      'linter_errors': 'error',
  \      'linter_ok': 'left'
  \    }
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                          " Highlight search results.
set incsearch
set ignorecase
set nosmartcase

if has('nvim')
  set inccommand="nosplit"
endif

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
if has('persistent_undo')
  set undodir=/var/tmp//,/tmp//
  set undofile
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Force write with sudo.
cmap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cool json formatting command.
" Requires jq installed and works with non Ascii characters like Japanese.
command! -range=% JSONFormat <line1>,<line2>!jq .

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
set completeopt=longest,menu,menuone,preview,noselect,noinsert

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
"" limit. Ensures also that this does not happen in terminal buffers.
function HighlightColorColumn()

  if exists('b:cc')
    silent! call matchdelete(b:cc)
  endif

  if &buftype !=# 'terminal'
    let b:cc = matchadd('ColorColumn', '\%81v', 100)
  endif
endfunction

if exists('+colorcolumn')
  highlight ColorColumn ctermbg=darkgrey guibg=darkgrey
  augroup ColorColumGroup
    autocmd!
    au BufWinEnter * call HighlightColorColumn()
  augroup END
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
set termencoding=utf-8

"" Also I prefer to handle all my files in disk as UTF-8 to avoid unnecessary
"" convertions between encoding formats. If the encoding format of a file on
"" disk is different from the terminal one then vim will automatically convert
"" between the two encodings when saving on disk and displaying on the terminal.
"" Note that not all encoding conversions are reversible so there may be some
"" loss of information. This is why is recommended to use always the same
"" encoding.
setglobal fileencoding=utf-8

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
set fileencodings=utf-8,euc-jp,sjis

" Internal encoding used by vim buffers, help and commands. This is better to
" keep the same s tenc.
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips Plugin
"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown Plugin
"
nmap <leader>lv <Plug>MarkdownPreview
nmap <leader>ll <Plug>MarkdownPreviewToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimtex Plugin
"
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=0
let conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_compiler_progname = 'nvr'

let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : '/tmp/latexmk',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-android Plugin
""
let g:android_sdk_path='/home/ryujin/Apps/android-sdk'
let g:gradle_daemon=1
let g:gradle_show_signs=0
let g:gradle_loclist_show=0
let g:gradle_sync_on_load=1
let g:netrw_browsex_viewer='google-chrome'

let g:gradle_glyph_error=''
let g:gradle_glyph_warning=''
let g:gradle_glyph_gradle=''
let g:gradle_glyph_android=''
let g:gradle_glyph_building=''

augroup GradleGroup
  autocmd!
  au BufWrite build.gradle call gradle#sync()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" QFEnter Plugin
""
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = [ '<CR>', '<2-LeftMouse>' ]
let g:qfenter_keymap.vopen = [ '<C-v>' ]
let g:qfenter_keymap.hopen = [ '<C-x>' ]
let g:qfenter_keymap.topen = [ '<C-t>' ]

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
"" Sandwich Plugin
""
"" Description:
""  Plugin for deleting, changing, and adding surroundings.
""
"" Usage:
""    sa{motion}{surrounding} - Adds surrounding
""    sd{motion}{surrounding} - Removes surrounding
""    sr{current}{replacement} - Replaces surrounding
""
""    Special Surroundings:
""
""      sa{motion}f - Adds function surrounding func(...)
""      sa{motion}t - Add HTML tag surrounding.
""      sa{motion}i - Add input surrounding.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF Plugin
"
" Resources:
"   - https://jesseleite.com/posts/4/project-search-your-feelings
nnoremap <leader>p :Files<CR>
nnoremap <leader>g :GitFiles<CR>
nnoremap <leader>/ :Ag<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ranger Plugin
"
nnoremap - :RangerEdit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DevIcons Plugin
"
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
" change the default folder/directory glyph/icon
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
" change the default open folder/directory glyph/icon (default is '')
let g:DevIconsDefaultFolderOpenSymbol = ''

" change the default dictionary mappings for exact file node matches
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['build.gradle'] = ''

" add or override individual additional filetypes
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['xml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['java'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rb'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sh'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sql'] = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE Plugin
"
let g:ale_sign_info = ''
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_open_list = 0
let g:ale_echo_msg_format = '%severity% [%linter%] (%code%) - %s'
let g:ale_echo_msg_info_str = ''
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_writegood_options = '--no-passive'
let g:ale_use_global_executables = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ' '

let g:ale_fixers = {
  \   'bib': ['bibclean'],
  \   'python': ['yapf']
\}

let g:ale_linters = {
  \   'bib': ['bibclean'],
  \   'go': ['gofmt', 'golint', 'go vet', 'golangserver'],
  \   'latex': ['proselint', 'chktex', 'lacheck'],
  \   'tex': ['proselint', 'chktex', 'lacheck'],
  \   'plaintex': ['proselint', 'chktex', 'lacheck'],
  \   'help': [],
  \   'python': ['flake8', 'pylint', 'pyls'],
  \   'ruby': ['solargraph', 'rubocop', 'ruby'],
  \   'groovy': ['android'],
  \   'xml': ['android'],
  \   'java': ['checkstyle', 'javalsp', 'android'],
  \   'kotlin': ['android', 'ktlint', 'languageserver'],
  \   'javascript': ['javascript-typescript'],
  \   'text': ['proselint', 'write-good'],
  \   'vim': ['vint'],
  \   'yaml': ['yamllint'],
  \   'mail': ['proselint', 'write-good']
\}

let g:ale_kotlin_languageserver_executable = '/home/ryujin/Apps/KotlinLanguageServer/build/install/kotlin-language-server/bin/kotlin-language-server'
let g:ale_java_javalsp_executable = '/home/ryujin/Apps/java-language-server/dist/mac/bin/launcher'

" Helper method used to check if the loclist is visible or not.
function! s:visibleLoc()
   return len(filter(getwininfo(), {i,v -> v.loclist}))
endfunc

" Magic function that synchronizes the cursor in the loclist with the cursor on
" the current buffer.
function! s:followLine()
   let curLine = line('.')
   if (exists('b:lastLine') && b:lastLine == curLine) || 0 == s:visibleLoc()
      return
   endif
   let b:lastLine = line('.')
   let ent = len(filter(getloclist('.'), {i,v -> v.lnum <= curLine}))
   if ent < 1 || (exists('b:lastEntry') && b:lastEntry == ent)
      return
   endif
   let b:lastEntry = ent
   let pos = [ 0, curLine, col('.'), 0 ]
   exe 'll '.ent
   call setpos('.', pos)
endfunc

augroup AleGroup
  autocmd!
  au CursorMoved <buffer> call <SID>followLine()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vista Plugin
"
let g:vista_default_executive='ale'
let g:vista_top_level_blink=[0, 0]
let g:vista_blink=[0, 0]
let g:vista#renderer#icons = {
      \ 'field': '',
      \ 'fields': '',
      \}
