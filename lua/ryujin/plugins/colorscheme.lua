local onedark = {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require("onedark").setup({
      -- styles: dark, darker, cool, deep, warm, warmer, light
      style = 'darker',
      colors = { fg = '#b2bbcc' }, --default: #a0a8b7
    })

    vim.cmd([[colorscheme onedark]])
  end
}

local kanagawa = {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = true,
      commentStyle = { italic = true },
      transparent = true,
      dimInactive = false,
      -- Themes wave, lotus, or dragon
      theme = 'dragon'
    })

    vim.cmd([[colorscheme kanagawa]])
  end
}

local nightfly = {
  "bluz71/vim-nightfly-guicolors",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme nightfly]])
  end,
}

return nightfly
