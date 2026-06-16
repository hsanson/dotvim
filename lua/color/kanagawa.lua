vim.pack.add({ 'https://github.com/rebelot/kanagawa.nvim' }, { load = true })

require('kanagawa').setup({
  compile = true,
  commentStyle = { italic = true },
  transparent = true,
  dimInactive = false,
  -- Themes: wave, lotus, or dragon
  theme = 'dragon',
})
