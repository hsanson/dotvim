"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Description:
""  This vimrc is my default vim configuration file.
""
"" Prerequisites:
""  - This configuration has been tested only on Ubuntu/Kubuntu version 10.10 
""    and 11.10. It may work in lower Ubuntu versions and other Debian 
""    distributions but there is no guarantee.
""
"" Installation:
""
""  - Vim in Ubuntu comes compiled with ruby 1.8 that is soon to be deprecated.
""    For this reason I recomend installing vim from source:
""
""    - Install packages required to build and use vim:
""
""      sudo apt-get install mercurial build-essential ruby1.9.1 ruby1.9.1-dev \
""         libncursesw5-dev exuberant-ctags libgtk2.0-dev libx11-dev xorg-dev  \
""         git-core wget sed ack-grep exuberant-ctags rake
""
""    - Install some needed gems to buils some plugins (e.g. command-t)
""
""      sudo gem1.9.1 install bundler
""      sudo gem1.9.1 install diff-lcs -v 1.1.2
""      sudo gem1.9.1 install rr -v 0.10.11
""      sudo gem1.9.1 install rspec-core -v 2.0.0.rc
""      sudo gem1.9.1 install rspec-expectations -v 2.0.0.rc
""      sudo gem1.9.1 install rspec-mocks -v 2.0.0.rc
""      sudo gem1.9.1 install rspec -v 2.0.0.rc
""      sudo gem1.9.1 install rake -v 0.8.7
""
""    - Download vim source code from mercurial
""
""      hg clone https://vim.googlecode.com/hg/ ~/source/vim
""
""    - Compile vim
""
""      ./configure --prefix=/opt --with-features=huge --enable-pythoninterp \
""          --enable-rubyinterp --enable-gui=gtk2 --enable-cscope --enable-multibyte \
""          --enable-cscope --with-x
""      make
""      sudo make install
""
""  - Clone my vim configuration repository
""
""    rm -rf ~/.vim ~/.vimrc  # This will delete all your current vim configuration!!
""    git clone .........  ~/.vim
""
""  - Create a symlink to the vimrc file
""
""    ln -s $(HOME)/.vim/vimrc $(HOME)/.vimrc
""
""  - Update the submodules
""
""    cd $(HOME)/.vim
""    git submodule update all
""
""  - Now make sure you read this file section by section since there are some
""  additional steps needed to get a fully functional vimrc configuration.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                      " Disable vi compatibility.
set bs=2                              " Sane backspace behavior.
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map make for easy access
map <F5> <ESC>:make<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Improve QuickFix Window

" Always open the quickfix window when running make, grep, grepadd and vimgrep
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep :botright cwindow
map <F6> <ESC>:cN<CR>                " Jump to prev error or warn
map <F7> <ESC>:cn<CR>                " Jump to next error or warn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Mouse Settings
"" Enabling the mouse has some advantages:
""   - You can resize windows using the mouse instead of using Ctrl-W combinations.
""   - Selecting text with the mouse wont include the left numbering.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a                           " Enable the mouse.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Pathogen Plugin
""
"" Description:
""  This vim plugin allows easy management of other plugins in bundles that 
""  is cleaner that mixing all plugin files inside the .vim folder. This
""  combined with git submodules and github makes for easy to manage plugins.
""
"" Installation:
""  This is already included in my git repository but in case I need to start
""  from scratch here are the steps to install it:
""
""  mkdir -p $HOME/.vim/autoload
""  wget --no-check-certificate \
""     https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim \
""     -O $HOME/.vim/autolad/pathogen.vim
""
"" Resources:
""   http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off " Temporarily disable so pathogen also loads ftdetect plugins.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on " Re-enable after pathogen is loaded.

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Coffee Script Filetype and syntax
""
"" Description:
""   Add coffee script configuration files:
""
"" Installation:
""
""   mkdir -p $HOME/.vim/bundle
""   cd $HOME/.vim
""   git submodule add https://github.com/kchmck/vim-coffee-script.git bundle/vim-coffee-script

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" HAML and SCSS Filetype and syntax
""
"" Description:
""  Add syntax higliting to the powerfull HAML templating systema and SCSS CSS
""  generator.
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add https://github.com/tpope/vim-haml.git bundle/vim-haml

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Look and Feel Settings
""
"" Description:
""  Add the vividchalk color scheme and enable syntax highligthing in 256 color
""  terminals.
""
"" Prerequisites:
""  - Make sure your terminal supports 256 colors. Konsole does but you must set
""    the TERM variable to xterm-256color in the schema properties.
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add https://github.com/tpope/vim-vividchalk.git bundle/vividchalk

syntax on                             " Enable syntax highlighting.
set t_Co=256                          " Enable 256 color mode in terminal.
set background=dark                   " I like dark backgrounds.
colors lucius-transparent             " My current favorite color scheme.

" Show tabs and tailing spaces.
" Note: to insert the middle point press "ctrl+k .M" in insert mode. Tha is
" control + k followed by a <dot> and the capital M.
:set list
:set listchars=tab:»·,trail:·,nbsp:·

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

" The next lines are needed so vim does not screw up folds when inserting text
" that might affect them until leaving insert mode. Foldmethod is local to the
" window. Also protect against screwing up folding when switching between
" windows.
" 
" http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Unfold new opened buffers
" http://vim.wikia.com/wiki/All_folds_open_when_open_a_file
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,java normal zR

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
set formatoptions=tcqmM

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

"" Mark the textwidth column with a white color to know when we passed the limit.
"" set colorcolumn=+0,+1,+2,+3
"" highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

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
"" Ack Plugin
""
"" Description:
""  This plugin allows vim to use the faster and easier ack-grep tool for
""  searching inside files.
""
"" Installation:
""  sudo aptitude install ack-grep
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
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

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NERDTree Plugin
""
"" Description:
""  The all powerful file explorer plugin for vim.
""
"" Usage:
""  :NERDTreeToggle
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add https://github.com/scrooloose/nerdtree.git bundle/nerdtree

" Set the window width
let g:NERDTreeWinSize = 35
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NERDTree Commenter
""
"" Description:
""  Easy commenting of source code.
""
"" Usage:
""  - cl - Comment line or visual block
""  - cn - Comment line or visual block forcing nesting
""  - cs - Comment line or visual block sexily
""  - cA - Add commend at the end of line and enter insert mode.
""  - ca - Change comment delimiter
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add https://github.com/scrooloose/nerdcommenter.git \
""                                   bundle/nerdcommenter

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim Fugitive
""
"" Description:
""  Best git wrapper for vim.
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add git://github.com/tpope/vim-fugitive.git bundle/fugitive
""
"" Resources:
""  https://github.com/tpope/vim-fugitive

set laststatus=2
set statusline=%{fugitive#statusline()}[%f]%=0x%B\ \ \ [%(%l/%L,%c%V%)]\ \ (%p%%)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim Rails
""
"" Description:
""  Enables a lot of goodies for Rails developers. Make sure to check the
""  plugin page for details on how to use this.
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add git://github.com/tpope/vim-rails.git bundle/vim-rails
""  git submodule add git://github.com/tpope/vim-endwise.git bundle/endwise
""
"" Resources:
""  https://github.com/tpope/vim-rails

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" OmniCppComplete
""
"" Description:
""  Vim comes with several omnifunctions to enable autocomplete of serveral
""  laguages but it lacks a omnifunction for C++. This plugin add this 
""  omnifunction to enable autocompletion of C++ code.
""
"" Installation:
""  wget http://www.vim.org/scripts/download_script.php?src_id=7722 -O \
""                                               /tmp/omnicppcomplete-0.41.zip
""  mkdir -p $HOME/.vim/bundle/omnicppcomplete
""  unzip -d $HOME/.vim/bundle/omnicppcomplete  /tmp/omnicppcomplete-0.41.zip
""
"" Resources:
""  http://www.vim.org/scripts/script.php?script_id=1520
""  http://vim.wikia.com/wiki/C%2B%2B_code_completion
""  http://design.liberta.co.za/articles/code-completion-intellisense-for-cpp-in-vim-with-omnicppcomplete/

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1       " show function parameters
let OmniCpp_MayCompleteDot = 1            " autocomplete after .
let OmniCpp_MayCompleteArrow = 1          " autocomplete after ->
let OmniCpp_MayCompleteScope = 1          " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Neocomplcache Plugin
""
"" Description:
""  A auto-complete plugin that actually works!
""
"" Notes:
""  - The plugin works very well but can be very slow. This is specially true
""    when opening a file for the first time as the plugin will parse and cache
""    the file keywords, tags, etc.
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add https://github.com/Shougo/neocomplcache.git \
""                                                        bundle/neocomplcache

let g:neocomplcache_enable_at_startup = 1             "Enable neocomplcache
let g:neocomplcache_enable_smart_case = 1             "Use smart case
let g:neocomplcache_enable_camel_case_completion = 1  "Use camelcase completion
let g:neocomplcache_enable_underbar_completion = 1    "Use underbar completion
let g:neocomplcache_min_syntax_length = 3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Easy Notes Plugin
""
"" Description:
""
""  Very nice plugin to take plain text notes in vim. Better than vim outliner.
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  mkdir -p $HOME/Notes
""  git submodule add https://github.com/xolox/vim-notes.git bundle/notes
""
"" Usage:
""  In vim use :NewNote to create a new note and :SearchNotes to search existing
""  notes.
""
"" Notes:
""  You may create a Nerdtree Bookmark to the g:notes_directory folder to
""  have quick access to your notes.

" This plugin assumes it is intalled directly in ~/.vim dir but we use pathogen
" plugin so we must update the paths accordingly.
let g:notes_suffix = '.txt'
let g:notes_directory = '~/Notes'             " Were to store notes
"let g:notes_shadowdir = '~/Notes/.shadow'    " Changing this breaks all.
let g:notes_indexfile = '~/Notes/.index.sqlite3'
let g:notes_indexscript = '~/.vim/bundle/notes/misc/notes/scanner.py'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" tGPG Plugin
""
"" Description:
""  tGPG Plugin for transparent editing of encrypted files. This is the only
""  plugin for handling encrypted GPG files that worked out of the box.
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle
""  cd .vim/bundle
""  git submodule add https://github.com/tomtom/tgpg_vim.git bundle/tgpg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TagBar Plugin and Ruby omnicomplete plugin
""
"" Description:
""  Tlist replacement with scoping.
""
"" Installation:
""  cd $HOME/.vim
""  mkdir -p bundle
""  git submodule add git://github.com/majutsushi/tagbar bundle/tagbar
""  git submodule add https://github.com/vim-scripts/rubycomplete.vim.git \
""                                                   bundle/rubycomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete=.,w,b,u,t
set tags=./.tags;$HOME

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Matchit Plugin
""
"" Description:
""  Allows you to configure % to match more than just single characters.
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle/matchit
""  wget http://www.vim.org/scripts/download_script.php?src_id=8196 \
""                                        --output-document=/tmp/matchit.zip
""  unzip -d $HOME/.vim/bundle/matchit /tmp/matchit.zip
""  rm -f /tmp/matchit.zip

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Surround Plugin
""
"" Description:
""  Plugin for deleting, changing, and adding surroundings.
""
"" Installation:
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add https://github.com/tpope/vim-surround.git bundle/surround
""
"" Usage:
""  Old text                  Command     New text ~
""  Hello *world!"            ds"         Hello world!
""  [123+4*56]/2              cs])        (123+456)/2
""  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
""  if *x>3 {                 ysW(        if ( x>3 ) {
""  my $str = *whee!;         vlllls'     my $str = 'whee!';

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim-preview Plugin
""
"" Description:
""  Allows to generate and preview HTML documents in a browser.
""
"" Installation:
""  sudo gem install RedCloth github-markup bluecloth
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add https://github.com/greyblake/vim-preview.git bundle/preview
""
"" Usage:
""  <leader>P will process markdown, textile, rdoc and html files and load them
""  in a browser.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Command-T Plugin
""
"" Description:
""  Implements TextMate command-T file search functionality.
""
"" Installation:
""  sudo aptitude install ruby ruby-dev rake
""  mkdir -p $HOME/.vim/bundle
""  cd $HOME/.vim
""  git submodule add git://git.wincent.com/command-t.git bundle/command-t
""  cd bundle/command-t
""  sudo gem install diff-lcs -v 1.1.2
""  sudo gem install nokogiri -v 1.4.4
""  sudo gem install mechanize -v 1.0.0
""  sudo gem install rr -v 1.0.2
""  sudo gem install rspec-core -v 2.5.1
""  sudo gem install rspec-expectations -v 2.5.0
""  sudo gem install rspec-mocks -v 2.5.0
""  sudo gem install rspec -v 2.5.0
""  rake make
""
"" Usage:
""  <leader>P will process markdown, textile, rdoc and html files and load them
""  in a browser.
""
"" Notes:
""  This plugin maps <C-s> to open files in split windows. Unfortunately in
""  Konsole this key combination is set to handle terminal flow control.

let g:CommandTAcceptSelectionSplitMap = '<C-b>'  " Remap the split open key.
