return {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require("onedark").setup({
      -- styles: dark, darker, cool, deep, warm, warmer, light
      style = 'darker',
      colors = { fg = '#b2bbcc' }, --default: #a0a8b7
    })
  end
}
