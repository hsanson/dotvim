vim.keymap.set('n', '<localleader>rr', function()
    require('kulala').run()
  end, {
  desc = 'Execute request under cursor',
  remap = false,
  buffer = 0
})

-- vim.keymap.set('n', '<localleader>rr', '<cmd>Rest run<cr>', {
--   desc = 'Execute REST request',
--   remap = false,
--   buffer = 0
-- })

-- vim.keymap.set('n', '<localleader>rl', '<cmd>Rest run last<cr>', {
--   desc = 'Repeat last REST request',
--   remap = false,
--   buffer = 0
-- })

vim.keymap.set('n', '<localleader>re', function()
    require("kulala").set_selected_env()
  end, {
  desc = 'Select Kulala environment file',
  remap = false,
  buffer = 0
})
