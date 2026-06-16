vim.pack.add({
  'https://github.com/ankushbhagats/pastel.nvim',
}, { load = true })

require("pastel").setup({
  style = {
    transparent = true,
  },
})
