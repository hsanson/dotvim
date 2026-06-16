vim.pack.add({
  'https://github.com/scottmckendry/cyberdream.nvim',
}, { load = true })

require("cyberdream").setup({
  transparent = true,
  italic_comments = true,
  hide_fillchars = false,
  terminal_colors = true,
  borderless_pickers = false,
})

