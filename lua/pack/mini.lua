vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.nvim', version = vim.version.range('*') },
}, { load = true })

require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.icons').setup()
