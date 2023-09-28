return {
  'famiu/feline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'lewis6991/gitsigns.nvim'
  },
  config = function()
    local feline = require('feline')

    feline.setup()
    feline.winbar.setup()
  end
}
