vim.pack.add({
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
}, { load = true })

require('render-markdown').setup({
  file_types = {
    'markdown', 'AgenticChat', 'latex', 'yaml',
    'asciidoc', 'typst', 'opencode_output', 'kulala_ui',
  },
  completions = { lsp = { enabled = true } },
  code = {
    border = 'thin',
  },
  pipe_table = {
    border_enabled = false
  },
  indent = {
    enabled = false
  }
})
