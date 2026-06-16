vim.pack.add({ 'https://github.com/Shatur/neovim-ayu' }, { load = true })

require('ayu').setup({
  mirage = true,
  overrides = {
    Normal = { bg = 'None' },
    ColorColumn = { bg = 'None' },
    SignColumn = { bg = 'None' },
    Folded = { bg = 'None' },
    FoldColumn = { bg = 'None' },
    CursorLine = { bg = 'None' },
    CursorColumn = { bg = 'None' },
    WhichKeyFloat = { bg = 'None' },
    VertSplit = { bg = 'None' },
  },
})
