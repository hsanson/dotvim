local opt = vim.opt

-------------------------------------------------------------------------------
-- General Settings
-------------------------------------------------------------------------------
opt.fileformats = "unix,dos" -- Use unix file format.
opt.number = true -- Show line number column.
opt.backup = false -- Stop vim from creating ~ files.
opt.writebackup = false -- No backups
opt.swapfile = false -- More hassel than solution.
opt.shortmess = "atsIc" -- Avoid unnecessary hit-enter prompts.
opt.joinspaces = false -- Avoid double spaces when joining lines
opt.showcmd = true -- Display commands as they are typed.
opt.scrolloff = 9999 -- Always keep the cursor at the center of window.
opt.lazyredraw = true -- Improve performance
opt.synmaxcol = 500 -- Improve scroll performance with long lines
opt.updatetime = 150 -- ms to wait for trigger event
opt.nrformats = "" -- Stop vim from treating zero padded numbers as octal
opt.equalalways = false -- No automatic resizing of windows.
opt.cursorline = true -- highlight current line in insert Mode.
opt.splitbelow = true
opt.splitright = true
opt.hidden = true -- Avoid loosing unsaved work when changing buffers.
opt.emoji = false -- Fix emoji rendering.
opt.pumblend = 20 -- Transparency to popup menu
opt.laststatus = 3
opt.linebreak = true
opt.termguicolors = true
opt.background = "dark"
opt.showmatch = false -- Do not highlight matching parenthesis

-- Box drawing Unicode characters:
-- https://shapecatcher.com/unicode/block/Box_Drawing
vim.opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}

-- Show tabs and tailing spaces.
-- Note: to insert the middle point press "ctrl+k .M" in insert mode. Tha is
-- control + k followed by a <dot> and the capital M.
opt.list = true
opt.listchars = {
  tab = "→ ",
  nbsp = "␣",
  trail = "•",
  extends = "»",
  precedes = "«",
}

-------------------------------------------------------------------------------
-- Search Settings
-------------------------------------------------------------------------------
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = false
opt.inccommand = "nosplit"
opt.path = "/usr/include,/usr/local/include,**;$HOME"

-------------------------------------------------------------------------------
-- Clipboard
--
--  - unnamedplus: system clipboard (Ctrl-v/Ctrl-p)
--  - unnamed:     paste clipboard (Linux/Unix only)
-------------------------------------------------------------------------------
opt.clipboard = "unnamedplus"

-------------------------------------------------------------------------------
-- Mouse Settings
-- Enabling the mouse has some advantages:
--   - You can resize windows using the mouse instead of using Ctrl-W combinations.
--   - Selecting text with the mouse wont include the left numbering.
-- Note: Mouse features do not work when running vim inside a tmux window.
-------------------------------------------------------------------------------
opt.mouse = "a"
opt.mousemodel = "extend"

-------------------------------------------------------------------------------
-- Tabs vs Spaces war
--
-- By default insert spaces instead of tabs. This may be overriden by the
-- configuration inside ftplugin directory for specific file types. For example
-- makefiles require real tabs to work so override this configuration in the
-- ftplugin make.vim file.
--
-- Note: If you want a real tab use "ctrl+v tab" in insert mode. That is control
-- + v follwed by a tab.
-------------------------------------------------------------------------------
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-------------------------------------------------------------------------------
-- Fold Settings
-------------------------------------------------------------------------------
opt.foldenable = true
opt.foldlevelstart = 99
opt.foldlevel = 99
opt.foldcolumn = "1"
opt.statuscolumn =
  '%=%l%s%#FoldColumn#%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : " ") : "  " }%*'

-------------------------------------------------------------------------------
-- Improve Vim's Command Line Autocompletion
-------------------------------------------------------------------------------
opt.infercase = true -- AutoComplete in Vim
opt.completeopt = "menu,menuone,noselect,noinsert"

opt.wildignore:append("*.o,*.obj,*.pyc,*.pyo,*.DS_STORE,*.db,*.swc,*.rbc")
opt.wildignore:append("__pycache__")
opt.wildignore:append("*/tmp/*,*.so,*.swp,*.zip")
opt.wildignore:append("vendor/rails/**,vendor/gems/**")
opt.wildignore:append("*.jar,*.class,*.log,*.gz")
opt.wildignore:append(".git,*.rbc,*.svn")
opt.wildignore:append("*.jpeg,*.jpg,*.jpeg*,*.png,*.gif")
opt.wildignore:append("*/log/*,*/.bundle/*,*/bin/*,*/tmp/*,*/build/*")
opt.wildignore:append("*/.sass-cache/*")

-------------------------------------------------------------------------------
-- Word Wrap
--
-- Auto formatting options. These determine where lines will be broken when
-- auto wrapping. The last two options (mM) are needed for multi byte characters (e.g.
-- Japanese)
opt.formatoptions = "tcrqjmM"

-- There are two word wrap methods, one with line breaks that adds an actual
-- '\n' character at the break place and without line breaks that only displays
-- text as wrapped but there is no actual break added to the text.

-- To enable word wrap with line breaks use the textwidth option below.
-- Note: Use "gq}" to wrap the current paragraph if it is not well formatted.
opt.textwidth = 80
