vim.pack.add({ 'https://github.com/folke/tokyonight.nvim' }, { load = true })

require('tokyonight').setup({
  transparent = true,
  lualine_bold = true,
  dim_inactive = false,
})
