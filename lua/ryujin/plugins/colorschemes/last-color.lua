return {
  "raddari/last-color.nvim",
  dependencies = {
    'rebelot/kanagawa.nvim',
  },
  lazy = false,
  priority = 800,
  config = function()
    local theme = require('last-color').recall() or 'kanagawa'
    vim.cmd.colorscheme(theme)
  end
}
