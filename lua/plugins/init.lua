return {
  -- other colorschemes:
  {
    'navarasu/onedark.nvim',
    lazy = true,
    priority = 1000,
    config = function()
      require("onedark").setup({
        -- styles: dark, darker, cool, deep, warm, warmer, light
        style = 'darker',
        colors = { fg = '#b2bbcc' }, --default: #a0a8b7
      })
    end
  },

  -- Personal Plugins
  { "hsanson/vim-im", dev = true },
  { "hsanson/vim-openapi", dev = true },
  { "hsanson/vim-review", dev = true },

  -- Syntax and language support
  { "neomutt/neomutt.vim" },
}
