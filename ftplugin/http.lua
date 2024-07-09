vim.keymap.set('n', '<localleader>rr', function()
    require('kulala').run()
  end, {
  desc = 'Execute request under cursor',
  remap = false,
  buffer = 0
})

vim.keymap.set('n', '<localleader>re', function()
    require("kulala").set_selected_env()
  end, {
  desc = 'Select Kulala environment file',
  remap = false,
  buffer = 0
})

vim.keymap.set('n', '<localleader>rh', function()
    require("kulala").toggle_view()
  end, {
  desc = 'Toogle headers and body response views',
  remap = false,
  buffer = 0
})
