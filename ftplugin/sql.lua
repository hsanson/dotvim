vim.keymap.set("n", "<localleader>re", "<Plug>(SelectConnection)", {
  desc = 'Open SQL connection selector',
  remap = false,
  buffer = true
})

vim.keymap.set({"n", "v"}, "<localleader>rr", "<Plug>(ExecuteStatement)", {
  desc = 'Execute SQL query under cursor',
  remap = false,
  buffer = true
})

vim.keymap.set("n", "<localleader>rf", "<Plug>(ExecuteFile)", {
  desc = 'Execture SQL queries in the current buffer file',
  remap = false,
  buffer = true
})
