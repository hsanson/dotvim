vim.pack.add({ 'https://github.com/ribru17/bamboo.nvim' }, { load = true })

require('bamboo').setup({
  transparent = true,
  dim_inactive = false,
  lualine = {
    transparent = true,
  },
})
