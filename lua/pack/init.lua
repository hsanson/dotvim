-- Shared dependencies
require("pack.plenary")
require("pack.nvim_nio")

-- Dev plugins (local source, must come before plugins that require() them)
require("pack.vim_im")
require("pack.usql")       -- required by pack.yarepl
require("pack.vim_android")
require("pack.vim_winmode")

-- UI / pickers (no inter-plugin deps at setup time)
require("pack.mini")
require("pack.snacks")
require("pack.which_key")

-- Treesitter
require("pack.nvim_treesitter")

-- Completion stack (engine before LSP)
require("pack.copilot")
require("pack.cmp")

-- LSP (needs blink.cmp capabilities)
require("pack.lspconfig")

-- Statusline (component deps loaded inside lualine.lua before setup)
require("pack.lualine")

-- Rooter (keymap uses snacks lazily, so order vs snacks doesn't matter)
require("pack.rooter")

-- Testing
require("pack.neotest")

-- Debugging
require("pack.nvim_dap")
require("pack.nvim_dap_view")   -- depends on nvim_dap
require("pack.nvim_coverage")

-- ALE (dev plugin, heavy config)
require("pack.ale")

-- File management
require("pack.diffs")
require("pack.yazi")

-- Misc tools
require("pack.agentic")
require("pack.img_clip")
require("pack.kulala")
require("pack.lilypond")
require("pack.live_preview")
require("pack.markview")
require("pack.origami")
require("pack.pantran")
require("pack.sops")
require("pack.typst_preview")
require("pack.yarepl")          -- depends on usql (loaded above)
require("pack.neomutt")
