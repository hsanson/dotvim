vim.keymap.set('n', '<localleader>rr', function()
    require('kulala').run()
  end, {
  desc = 'Execute request under cursor',
  remap = false,
  buffer = true
})

vim.keymap.set('n', '<localleader>re', function()
    require("kulala").set_selected_env()
  end, {
  desc = 'Select Kulala environment file',
  remap = false,
  buffer = true
})

vim.keymap.set('n', '<localleader>rh', function()
    require("kulala").toggle_view()
  end, {
  desc = 'Toogle headers and body response views',
  remap = false,
  buffer = true
})

vim.keymap.set('n', '<localleader>ri', function()
    require("kulala").inspect()
  end, {
  desc = 'Inspect current request.',
  remap = false,
  buffer = true
})

vim.keymap.set('n', '<localleader>rt', function()
    require("kulala.ui.auth_manager").open_auth_config()
  end, {
  desc = 'Open auth manager',
  remap = false,
  buffer = true
})
