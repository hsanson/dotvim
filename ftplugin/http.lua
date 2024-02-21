vim.keymap.set('n', '<Leader>rr', '<Plug>RestNvim<CR>', {
  desc = 'Execute REST request',
  remap = false,
  buffer = 0
})

vim.keymap.set('n', '<Leader>rt', '<Plug>RestNvimPreview', {
  desc = 'Preview REST curl command',
  remap = false,
  buffer = 0
})

vim.keymap.set('n', '<Leader>re', function()
    require("telescope").extensions.rest.select_env()
  end, {
  desc = 'Select REST environment file',
  remap = false,
  buffer = 0
})
