vim.pack.add({ 'https://github.com/carlos-algms/agentic.nvim' }, { load = true })

require('agentic').setup({
  provider = vim.uv.os_uname().sysname == 'Darwin' and 'claude-agent-acp' or 'opencode-acp',
  acp_providers = {
    ['opencode-acp'] = {
      command = 'opencode',
    },
  },
  debug = true,
  keymaps = {
    widget = {
      close = 'q',
      change_mode = {
        {
          '<S-Tab>',
          mode = { 'i', 'n', 'v' },
        },
      },
    },
    prompt = {
      submit = {
        '<CR>',
        {
          '<C-s>',
          mode = { 'n', 'v', 'i' },
        },
      },
      paste_image = {
        {
          '<C-p>',
          mode = { 'n', 'i' },
        },
      },
    },
  },
})

vim.keymap.set({ 'n', 'v', 'i' }, '<C-\\>', function() require('agentic').toggle() end,
  { desc = 'Toggle Agentic Chat' })
vim.keymap.set({ 'n', 'v' }, '<leader>aa', function() require('agentic').add_selection_or_file_to_context() end,
  { desc = 'Add file or selection to Agentic Context' })
vim.keymap.set({ 'n', 'v', 'i' }, '<C-,>', function() require('agentic').new_session() end,
  { desc = 'New Agentic Session' })
