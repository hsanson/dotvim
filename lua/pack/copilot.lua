vim.pack.add({ 'https://github.com/zbirenbaum/copilot.lua' }, { load = true })

require('copilot').setup({
  -- Disable suggestions and panel modules to avoid interfering with copilot-cmp
  suggestion = { enabled = false },
  panel = { enabled = false },
  copilot_model = 'gpt-41-copilot',
})
