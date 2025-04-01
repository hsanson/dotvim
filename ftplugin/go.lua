local opt = vim.opt_local
opt.expandtab = false

local opts = { noremap = true, silent = true, buffer = true }

opts.desc = "Run test under the cursor"
vim.keymap.set('n', '<localleader>rr', ':lua require("neotest").run.run()<CR>', opts)

opts.desc = "Run all tests inside current file"
vim.keymap.set('n', '<localleader>rf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)

opts.desc = "Debug current file"
vim.keymap.set('n', '<localleader>rd', ':lua require("neotest").run.run({ suite = false, strategy = "dap" })<CR>', opts)

opts.desc = "Run all test suite"
vim.keymap.set('n', '<localleader>ra', ':lua require("neotest").run.run({ suite = true })<CR>', opts)

opts.desc = "Toggle test summary"
vim.keymap.set('n', '<localleader>rt', ':Neotest summary<CR>', opts)

opts.desc = "Show test results"
vim.keymap.set('n', '<localleader>rh', ':lua require("neotest").output.open({ enter = false, short = false })<CR>', opts)

opts.desc = "Add variable under cursor to watch list"
vim.keymap.set('n', '<localleader>rw', ':DapViewWatch<CR>', opts)
