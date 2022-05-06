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
""    sudo apt-get install xsel cmake g++ \
""      pkg-config unzip automake autoconf libtool-bin \
""      silversearcher-ag jq zathura libncurses5-dev \
""      xsel texlive-extra-utils
""
""    pip3 install --user neovim-remote neovim vim-vint
""
""  Install optional ALE linters and tools:
""
""    sudo apt-get install shellcheck chktex lacheck nodejs ruby2.5
""    pip3 install --user jedi proselint autopep8 \
""         flake8 pyflakes rope pycodestyle pydocstyle yapf \
""         yamllint jedi-language-server
""    sudo gem install solargraph rubocop sqlint mdl
""    sudo npm install --global prettier vls \
""         javascript-typescript-langserver write-good \
""         dockerfile_lint markdownlint-cli pyright
""
""    curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
""
""    Java Language Server
""
""      git clone https://github.com/georgewfraser/java-language-server
""      cd java-language-server
""      ./scripts/link_{linux|mac|windows}.sh
""      mvn package -DskipTests
""
""    Eclipse Language Server
""
""       git clone https://github.com/eclipse/eclipse.jdt.ls.git
""       cd eclipse.jdt.ls
""       JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64 ./mvnw clean verify
""
""    Kotlin Language Server
""
""       git clone https://github.com/fwcd/KotlinLanguageServer.git
""       cd KotlinLanguageServer.git
""       ./gradlew :server:installDist
""
""    Ktlint
""
""       curl -sSLO https://github.com/shyiko/ktlint/releases/download/0.42.1/ktlint
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

if !has('nvim')
  call ch_logfile(expand('/tmp/chlogfile.log'), 'w')
  set ttymouse=xterm
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins
""
call plug#begin('~/.config/nvim/bundle')

" Personal plugins
" Clone these from https://github.com/hsanson
Plug '~/Projects/vim/vim-android'
Plug '~/Projects/vim/vim-winmode'
Plug '~/Projects/vim/vim-im'
Plug '~/Projects/vim/vim-openapi'
Plug '~/Projects/vim/vim-review'
Plug '~/Projects/vim/slimux'
Plug '~/Projects/vim/ale'

" Helper and tools
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'machakann/vim-sandwich'
Plug 'jeanCarloMachado/vim-toop'
Plug 'romainl/vim-cool'

" Text object add ons
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-function'

" Colorschemes
if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter'
endif
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" Syntax and language support
Plug 'udalov/kotlin-vim'
Plug 'vim-scripts/yaml.vim'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'posva/vim-vue'
Plug 'neomutt/neomutt.vim'
Plug 'tpope/vim-markdown'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'habamax/vim-asciidoctor'
Plug 'hashivim/vim-terraform'
Plug 'pearofducks/ansible-vim'
Plug 'peterhoeg/vim-qml'

" Document editing
Plug 'lervag/vimtex'
Plug 'alok/notational-fzf-vim'

" Linting and Auto completion
Plug 'liuchengxu/vista.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'

if has('python3')
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
endif

" Code navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'unblevable/quick-scope'

" Visual aid and eyecandy
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" SQL
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

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
set scrolloff=9999                    " Always keep the cursor at the center of window.
set lazyredraw                        " Improve performance
set nofoldenable                      " Disable folding that slows down auto-completion
set foldlevel=99
set nrformats=                        " Stop vim from treating zero padded numbers as octal
set noequalalways                     " No automatic resizing of windows.
set cursorline                        " highlight current line in insert Mode.
set nocursorcolumn                    " Highlight current column in Insert Mode.
set switchbuf=useopen,usetab
set splitbelow
set splitright
set hidden                            " Avoid loosing unsaved work when changing buffers.
set spelllang=en,es
set noemoji                           " Fix emoji rendering.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Clipboard
""
""  - unnamedplus: system clipboard (Ctrl-v/Ctrl-p)
""  - unnamed:     paste clipboard (Linux/Unix only)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus

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

" Quick spell correcting
" https://castel.dev/post/lecture-notes-1/
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

" WinMode
nmap <leader>w <Plug>WinModeStart

" Disable accidental Ex mode
nnoremap Q <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Slimux plugin
let g:slimux_select_from_current_window = 1
let g:slimux_pane_format = '#(~/.tmux/wname #W)'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toop + Slimux collaboration
"
" <leader>rG   Send all text from cursor to end of file.
" <leader>rGG  Send all text from cursor to start of file.
" <leader>r$   Send all text from cursor to end of line.
" <leader>r_   Send current line independent of cursor position.
" <leader>r<motion> Send text from cursor to end of motion.
call toop#mapFunction('SlimuxSendCode', '<leader>r')

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
" syntax on sync minlines=256
syntax on

" Enable true color support in NEOVIM
" Setting this on vim disables terminal colors.
if has('nvim') && has('termguicolors')
  set termguicolors
endif

"set synmaxcol=200                     " Improve scroll performance with long lines
set background=dark                    " I like dark backgrounds.

augroup SyntaxGroup
  autocmd!
  " Force all colorschemes to have transparent background.
  au ColorScheme * hi Normal guibg=NONE ctermbg=NONE
  au ColorScheme * hi NormalFloat guibg=NONE ctermbg=NONE
  au ColorScheme * hi EndOfBuffer guibg=NONE ctermbg=NONE
  " Make cursorline transparent too so only the line number is highlighted on the
  " current line.
  au ColorScheme * hi CursorLine guibg=NONE ctermbg=NONE term=NONE cterm=NONE

  " Disable match paren that confuses me
  au VimEnter * execute "NoMatchParen"
augroup END

let g:one_allow_italics = 1
colors gruvbox

" Apply some color to the popup menu used for auto-completion.
highlight Pmenu ctermbg=203 gui=bold

if has('nvim')
  set pumblend=20
endif

" Show tabs and tailing spaces.
" Note: to insert the middle point press "ctrl+k .M" in insert mode. Tha is
" control + k followed by a <dot> and the capital M.
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:»,precedes:«

" Highlight japanese space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" Use treesitter for folding
if has('nvim')
  set fillchars+=fold:\ 
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline status line
"

if has('nvim')
  " Support global status bar.
  " https://www.fileformat.info/info/unicode/block/box_drawing/list.htm
  set laststatus=3
  set fillchars+=horiz:═,horizup:╩,horizdown:╦
  set fillchars+=vert:║,vertleft:╣,vertright:╠,verthoriz:╬
endif

let g:airline_powerline_fonts = 1
let g:airline_right_sep=''
let g:airline_left_sep=''
let airline#extensions#ale#warning_symbol = ''
let airline#extensions#ale#error_symbol = ''
let airline#extensions#ale#checking_symbol = ''
let airline#extensions#ale#show_line_numbers = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_detect_iminsert=1
let g:airline_skip_empty_sections=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#bufferline#enabled = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.paste = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''

let g:airline_mode_map = {
    \ '__'     : '- ',
    \ 'c'      : ' ',
    \ 'i'      : ' ',
    \ 'ic'     : ' ',
    \ 'ix'     : ' ',
    \ 'n'      : ' ',
    \ 'multi'  : 'M ',
    \ 'ni'     : ' ',
    \ 'no'     : ' ',
    \ 'R'      : 'R ',
    \ 'Rv'     : 'R ',
    \ 's'      : 'S ',
    \ 'S'      : 'S ',
    \ ''     : 'S ',
    \ 't'      : 'T ',
    \ 'v'      : '﯎ ',
    \ 'V'      : '﯎ ',
    \ ''     : '﯎ ',
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
set mouse=a                           " Enable the mouse.
set mousehide

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
set completeopt=menu,menuone,noselect,noinsert

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
set formatoptions=tcrqjmM

" Some runtime configuration files like to override formatoptions depending on
" filetype but we like to keep out the o option so forced here for all
" filetypes.
augroup FormatOptions
  autocmd!
  au FileType * setlocal formatoptions-=o
augroup END

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
scriptencoding utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips Plugin
"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Asyncomplete
"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <cr>  pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <expr> <Tab> pumvisible() ? asyncomplete#close_popup() : "\<Tab>"

let g:asyncomplete_auto_completeopt = 0

augroup AsynCompleteAle
  autocmd!
  au User asyncomplete_setup call asyncomplete#register_source(
      \ asyncomplete#sources#ale#get_source_options({
      \ 'priority': 10,
      \ }))

  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 15,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

  if has('python3')
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
  endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickScope Configuration
"
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown Plugin
"
nmap <leader>lv <Plug>MarkdownPreview
nmap <leader>ll <Plug>MarkdownPreviewToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Notational FZF Plugin
"
let g:nv_search_paths = ['~/Seafile/Notes', '~/Documents/Seafile/Notes']
let g:nv_default_extension = '.adoc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimtex Plugin
"
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:tex_flavor='latex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_fold_enabled = 0

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

let g:gradle_glyph_error=''
let g:gradle_glyph_warning=''
let g:gradle_glyph_gradle=''
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
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
command! -bang -nargs=* Find call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

nnoremap <leader>p :Files<CR>
nnoremap <leader>o :Find<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ranger
"
function! Ranger(dirname) abort
  let s:cwin = win_getid(winnr())
  let vertical_border = 2
  let horizontal_border = 2
  let height = &lines - vertical_border
  let width = &columns - horizontal_border
  let row = (&lines / 2) - (height / 2)
  let column = (&columns / 2) - (width / 2)
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': column,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = '╭' . repeat('─', width - 2) . '╮'
  let mid = '│' . repeat(' ', width - 2) . '│'
  let bot = '╰' . repeat('─', width - 2) . '╯'
  let lines = [top] + repeat([mid], height - 2) + [bot]
  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  let s:cwin1 = nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Floating
  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4
  let s:cwin2 = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)

  let s:callback = {
        \  'tempname': tempname(),
        \  'cwin': s:cwin,
        \  'cwin1': s:cwin1,
        \  'cwin2': s:cwin2
        \}

  function! s:callback.on_exit(id, code, event) dict abort
    try
      if filereadable(self.tempname)
        let names = readfile(self.tempname)
        call win_execute(self.cwin, 'silent! edit ' . fnameescape(names[0]))
      endif
    endtry
    call nvim_set_current_win(self.cwin)
    call nvim_win_close(self.cwin1, v:true)
    call nvim_win_close(self.cwin2, v:true)
  endfunction

  let cmd = 'ranger --choosefiles='.s:callback.tempname.' '.shellescape(a:dirname)
  call termopen(cmd, s:callback)
  startinsert
endfunction

if has('nvim')
  nnoremap - :call Ranger(expand("%:p:h"))<CR>
else
  nnoremap - :Explore<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FloatTerm
"
function! FloatTerm() abort
  let vertical_border = 2
  let horizontal_border = 15
  let height = &lines - vertical_border
  let width = &columns - horizontal_border
  let row = (&lines / 2) - (height / 2)
  let column = (&columns / 2) - (width / 2)
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': column,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = '╭' . repeat('─', width - 2) . '╮'
  let mid = '│' . repeat(' ', width - 2) . '│'
  let bot = '╰' . repeat('─', width - 2) . '╯'
  let lines = [top] + repeat([mid], height - 2) + [bot]
  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Floating
  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4
  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  call termopen('bash', { 'on_exit': 'OnLazyGitExit' })
  startinsert
endfunction

nnoremap <Leader>t :call FloatTerm()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE Plugin
"
let g:ale_sign_info = ''
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_priority = 4
let g:ale_open_list = 0
let g:ale_echo_msg_format = '%severity% [%linter%] (%code%) - %s'
let g:ale_echo_msg_info_str = ''
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_writegood_options = '--no-passive'
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ' '
let g:ale_floating_preview = 1
let g:ale_hover_to_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_sign_column_always = 1
let g:ale_python_auto_pipenv = 1
let g:ale_python_auto_poetry = 1
let g:ale_completion_autoimport = 1
let g:ale_send_to_neovim_diagnostics = 1

let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'bib': ['bibclean'],
  \   'python': ['yapf'],
  \   'openapi': ['prettier'],
  \   'yaml': ['prettier'],
  \   'ruby': ['rubocop'],
  \   'kotlin': ['ktlint']
\}

let g:ale_linters = {
  \   'markdown': ['markdownlint'],
  \   'asciidoc': [],
  \   'dockerfile': ['dockerfile_lint'],
  \   'bib': ['bibclean'],
  \   'go': ['gofmt', 'golint', 'go vet', 'golangserver'],
  \   'latex': ['proselint', 'chktex', 'lacheck'],
  \   'tex': ['proselint', 'chktex', 'lacheck'],
  \   'plaintex': ['proselint', 'chktex', 'lacheck'],
  \   'help': [],
  \   'python': ['flake8', 'pylint', 'jedils'],
  \   'ruby': ['solargraph', 'rubocop', 'ruby'],
  \   'groovy': ['android'],
  \   'xml': ['android'],
  \   'java': ['eclipselsp'],
  \   'kotlin': ['ktlint', 'languageserver'],
  \   'javascript': ['eslint'],
  \   'vue': ['vls'],
  \   'text': ['proselint', 'write-good'],
  \   'vim': ['vint', 'ale_custom_linting_rules'],
  \   'ansible': ['ansible-lint'],
  \   'yaml': ['yamllint', 'yaml-language-server'],
  \   'openapi': ['yamllint', 'ibm-validator'],
  \   'terraform': ['checkov', 'terraform', 'tflint', 'terraform_ls'],
  \   'mail': ['proselint', 'write-good'],
  \   'rust': ['analyzer']
\}

let g:ale_pattern_options = {
\   '.gitlab-ci\.yml$': {
\       'ale_linters': ['gitlablint', 'yamllint'],
\   },
\}

let g:ale_linter_aliases = {
      \ 'asciidoctor': 'asciidoc'
      \}

call airline#parts#define_function(
   \ 'gradle-running',
   \ 'lightline#gradle#running'
   \)

 let g:airline_section_x = airline#section#create_right([
   \ 'filetype',
   \ 'gradle-running'
   \])

let g:ale_kotlin_languageserver_executable = '/home/ryujin/Apps/KotlinLanguageServer/server/build/install/server/bin/kotlin-language-server'
let g:ale_java_javalsp_executable = '/home/ryujin/Apps/java-language-server/dist/lang_server_linux.sh'
let g:ale_sh_bashate_options = '-i E003 --max-lin-length 100'
let g:ale_reason_ls_executable = '/home/ryujin/Apps/rls-linux/reason-language-server'
let g:ale_ruby_rubocop_auto_correct_all = 1
let g:ale_java_eclipselsp_path = '/home/ryujin/Apps/eclipse.jdt.ls'

function ALELSPMappings()
  nnoremap <buffer> gk :ALEDocumentation<cr>
  nnoremap <buffer> gr :ALEFindReferences<cr>
  nnoremap <buffer> gd :ALEGoToDefinition<cr>
  nnoremap <buffer> gy :ALEGoToTypeDefinition<cr>
  nnoremap <buffer> gh :ALEHover<cr>
  setlocal omnifunc=ale#completion#OmniFunc
endfunction

augroup ALEMappings
  autocmd!
  autocmd User ALELSPStarted call ALELSPMappings()
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hexokinase Plugin
"
let g:Hexokinase_refreshEvents = ['TextChanged', 'InsertLeave']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aciidoc Plugin
let g:asciidoctor_syntax_conceal = 1
let g:asciidoctor_folding = 1
let g:asciidoctor_img_paste_command = 'xclip -selection clipboard -t image/png -o > %s%s'

function! ViewMappings()
  nnoremap <buffer> <leader>lv :silent exe '!google-chrome ' . expand('%:p')<CR>
endfunction

augroup AsciiDoctor | au!
  autocmd!
  au BufNew,BufRead *.adoc,*.md,*.html call ViewMappings()
augroup end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dadbod and Dadbod-UI Plugins
"
let g:db_ui_icons = {
    \ 'expanded': '▾',
    \ 'collapsed': '▸',
    \ 'saved_query': '*',
    \ 'new_query': '+',
    \ 'tables': '~',
    \ 'buffers': '»',
    \ 'connection_ok': '✓',
    \ 'connection_error': '✕',
    \ }

let g:db_ui_winwidth = 50

let g:db_ui_save_location = '~/.config/dadbod/queries'

" Source dabbod database connection configurations.
if filereadable(expand('~/.config/dadbod/connections'))
  source ~/.config/dadbod/connections
endif
