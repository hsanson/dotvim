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
""         git-core wget sed ack-grep exuberant-ctags rake python2.7-dev
""
""    - Download vim source code from mercurial
""
""      hg clone https://vim.googlecode.com/hg/ ~/source/vim
""
""    - Compile vim
""
""      ./configure --prefix=/usr/local --with-features=huge --enable-pythoninterp \
""          --enable-rubyinterp --enable-gui=gtk2 --enable-cscope --enable-multibyte \
""          --enable-cscope --with-x --enable-pythoninterp \
""          --with-python-config-dir=/usr/lib/python2.7/config
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
set scrolloff=9999                    " Always keep the cursor at the center of window.
autocmd InsertEnter * se cul          " Highlight current line in Insert Mode.
autocmd InsertLeave * se nocul        " Don't highlight current line in other modes.
set switchbuf=useopen,split
cmap w!! w !sudo tee % >/dev/null     " Save file as root

" Set search path for gf command
set path=/usr/include,/usr/local/include,**;$HOME

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
map <F5> <ESC>:silent! make<CR><C-l>


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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a                           " Enable the mouse.


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
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'git://github.com:yuratomo/java-api-complete.git'
Bundle 'git://github.com:yuratomo/java-api-javax.git'
Bundle 'git://github.com:yuratomo/java-api-org.git'
Bundle 'git://github.com:yuratomo/java-api-sun.git'
Bundle 'git://github.com:yuratomo/java-api-servlet2.3.git'
Bundle 'git://github.com:yuratomo/java-api-android.git'
Bundle 'tomtom/tcomment_vim'
" easytags is disabled because it hangs vim when executing
"Bundle 'xolox/easytags.git'
"Bundle 'tomtom/tgpg_vim.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-vividchalk.git'
Bundle 'Shougo/neocomplcache.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-haml.git'
"Bundle 'greyblake/vim-preview.git'
"" vim-preview requires these gems installed: RedCloth github-markup bluecloth
"Bundle 'scrooloose/nerdcommenter.git'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/rubycomplete.vim.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
"Bundle 'git://repo.or.cz/vcscommand.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'vim-scripts/DrawIt.git'
Bundle 'vim-scripts/sudo.vim.git'
"Bundle 'pydave/AsyncCommand.git'
"Bundle 'suan/vim-instant-markdown.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'kien/ctrlp.vim.git'
"Bundle 'vim-scripts/YankRing.vim.git'
Bundle 'vim-scripts/VOoM.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'omnicppcomplete'
Bundle 'matchit'

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
"" Look and Feel Settings
""
"" Prerequisites:
""  - Make sure your terminal supports 256 colors. Konsole does but you must set
""    the TERM variable to xterm-256color in the schema properties.
""
syntax on                             " Enable syntax highlighting.
set t_Co=256                          " Enable 256 color mode in terminal.
set background=dark                   " I like dark backgrounds.
let g:solarized_termcolors=256
let g:solarized_termtrans = 1
colors solarized                      " My current favorite color scheme.

" Show tabs and tailing spaces.
" Note: to insert the middle point press "ctrl+k .M" in insert mode. Tha is
" control + k followed by a <dot> and the capital M.
set list
set listchars=tab:»·,trail:·,nbsp:·

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
set foldlevelstart=20
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
let g:NERDTreeQuitOnOpen = 1
" Quick toogle tree
nmap <silent> <leader>p :NERDTreeToggle<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim Fugitive
""
"" Description:
""  Best git wrapper for vim.
""
"" Resources:
""  https://github.com/tpope/vim-fugitive

set laststatus=2
set statusline=%{fugitive#statusline()}[%f]%=0x%B\ \ \ [%(%l/%L,%c%V%)]\ \ (%p%%)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" OmniCppComplete
""
"" Description:
""  Vim comes with several omnifunctions to enable autocomplete of serveral
""  laguages but it lacks a omnifunction for C++. This plugin add this 
""  omnifunction to enable autocompletion of C++ code.
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
"" EasyTags Plugin
""
"" Description:
""  Auto generate ctags for edited files.
""
set complete=.,w,b,u,t
set tags=.tags
let g:easytags_by_filetype = '~/.vim/tags'
let g:easytags_dynamic_files = 1
let g:easytags_include_members = 1
let g:easytags_resolve_links = 1
let g:easytags_python_enabled = 1

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
let g:neocomplcache_enable_at_startup = 0             "Enable neocomplcache
let g:neocomplcache_enable_smart_case = 1             "Use smart case
let g:neocomplcache_enable_camel_case_completion = 0  " Disable camelcase completion
let g:neocomplcache_enable_underbar_completion = 0    " Disable underbar completion
let g:neocomplcache_enable_fuzzy_completion = 1       " Enable fuzzy completion
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_min_syntax_length = 3

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
let g:voom_tree_width=60
let g:voom_ft_modes = { 'markdown': 'markdown', 'pandoc': 'markdown', 'tex': 'latex' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" tGPG Plugin
""
"" Description:
""  tGPG Plugin for transparent editing of encrypted files. This is the only
""  plugin for handling encrypted GPG files that worked out of the box.
""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Android Java complete plugin
""
let g:android_sdk_path="/home/ryujin/Apps/android-sdk-r20"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TagBar Plugin and Ruby omnicomplete plugin
""
"" Description:
""  Tlist replacement with scoping.
""
"" Resources:
""  https://github.com/majutsushi/tagbar/wiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
"" Matchit Plugin
""
"" Description:
""  Allows you to configure % to match more than just single characters.
""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim-preview Plugin
""
"" Description:
""  Allows to generate and preview HTML documents in a browser.
""
"" Usage:
""  <leader>P will process markdown, textile, rdoc and html files and load them
""  in a browser.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YankRing Plugin
" 
" Description:
"  Facilitates the handling of yanked text in registers.
let g:yankring_replace_n_pkey = '<C-j>'
let g:yankring_replace_n_nkey = '<C-k>'

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
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_dotfiles=1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=vendor/rails/**
set wildignore+=public/**
set wildignore+=*.jar,*.class

"let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'current',
  \ }

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
