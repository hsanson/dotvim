vim.keymap.set('n', '<localleader>rr', '<Cmd>Rest run<CR>', {
  desc = 'Execute request under cursor',
  remap = false,
  buffer = true,
})

vim.keymap.set('n', '<localleader>re', '<Cmd>Rest env select<CR>', {
  desc = 'Select rest.nvim environment file',
  remap = false,
  buffer = true,
})

vim.keymap.set('n', '<localleader>rh', '<Cmd>Rest open<CR>', {
  desc = 'Open rest.nvim result pane',
  remap = false,
  buffer = true,
})

vim.keymap.set('n', '<localleader>ri', '<Cmd>Rest logs<CR>', {
  desc = 'Open rest.nvim request logs',
  remap = false,
  buffer = true,
})
