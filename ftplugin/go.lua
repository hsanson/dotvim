local opt = vim.opt_local
opt.expandtab = false

local opts = { noremap = true, silent = true, buffer = true }

local function smart_debug()
  local file_name = vim.api.nvim_buf_get_name(0)
  local is_test_file = file_name:match("_test") or file_name:match(".spec") or file_name:match("test_")

  if is_test_file then
    require("neotest").run.run({ suite = false, strategy = "dap" })
  else
    require("dap").continue()
  end
end

opts.desc = "Run test under the cursor"
vim.keymap.set('n', '<localleader>rr', ':lua require("neotest").run.run()<CR>', opts)

opts.desc = "Run all tests inside current file"
vim.keymap.set('n', '<localleader>rf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)

opts.desc = "Debug current file"
vim.keymap.set('n', '<localleader>rd', smart_debug, opts)

opts.desc = "Run all test suite"
vim.keymap.set('n', '<localleader>ra', ':lua require("neotest").run.run({ suite = true })<CR>', opts)

opts.desc = "Toggle test summary"
vim.keymap.set('n', '<localleader>rt', ':Neotest summary<CR>', opts)

opts.desc = "Show test results"
vim.keymap.set('n', '<localleader>rh', ':lua require("neotest").output_panel.toggle()<CR>', opts)

opts.desc = "Add variable under cursor to watch list"
vim.keymap.set('n', '<localleader>rw', ':DapViewWatch<CR>', opts)
