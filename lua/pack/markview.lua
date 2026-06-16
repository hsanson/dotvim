vim.pack.add({ 'https://github.com/OXY2DEV/markview.nvim' }, { load = true })

-- From lazy `init`: register kulala_ui as a markdown parser alias before the
-- plugin loads so markview can parse kulala response buffers.
vim.treesitter.language.register('markdown', 'kulala_ui')

-- Kulala sets its response buffer filetype to "kulala_ui" but renders content
-- as markdown. Defer attach by 100ms to avoid a race with kulala writing content.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'kulala_ui',
  callback = function(ev)
    vim.defer_fn(function()
      require('markview.actions').attach(ev.buf)
    end, 100)
  end,
})

require('markview').setup({
  preview = {
    enable_hybrid_mode = false,
    linewise_hybrid_mode = true,
    hybrid_modes = { 'n' },
    filetypes = {
      'markdown', 'AgenticChat', 'latex', 'yaml',
      'asciidoc', 'typst', 'opencode_output', 'kulala_ui',
    },
    icon_provider = 'mini',
  },
  yaml = {
    enable = false,
  },
  asciidoc = {
    list_items = {
      shift_width = 2,
      wrap = true,
    },
    document_attributes = {
      enable = false,
    },
    tocs = {
      enable = false,
    },
  },
})
