vim.pack.add({
  'https://github.com/raddari/last-color.nvim',
}, { load = true })

local theme = require('last-color').recall() or 'vim'
vim.cmd.colorscheme(theme)
