return {
  "raddari/last-color.nvim",
  lazy = false,
  priority = 800,
  config = function()
    local theme = require('last-color').recall() or 'vim'
    vim.cmd.colorscheme(theme)
  end
}
