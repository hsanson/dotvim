vim.pack.add({ 'https://github.com/chrisgrieser/nvim-origami' }, { load = true })

require('origami').setup({
  foldKeymaps = {
    setup = false,
  },
})
