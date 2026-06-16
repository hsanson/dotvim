vim.pack.add({ 'https://github.com/navarasu/onedark.nvim' }, { load = true })

require('onedark').setup({
  transparent = true,
  -- styles: dark, darker, cool, deep, warm, warmer, light
  style = 'darker',
})
