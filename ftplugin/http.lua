vim.keymap.set('n', '<localleader>rr', '<cmd>Rest run<cr>', {
  desc = 'Execute REST request',
  remap = false,
  buffer = 0
})

vim.keymap.set('n', '<localleader>rl', '<cmd>Rest run last<cr>', {
  desc = 'Repeat last REST request',
  remap = false,
  buffer = 0
})

vim.keymap.set('n', '<localleader>re', function()
    require("telescope").extensions.rest.select_env()
  end, {
  desc = 'Select REST environment file',
  remap = false,
  buffer = 0
})
