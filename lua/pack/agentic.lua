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

local function is_agentic_open()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local filetype = vim.bo[buf].filetype
    if filetype:match('^Agentic') then
      return true
    end
  end

  return false
end

local function open_agentic_if_closed()
  if not is_agentic_open() then
    require('agentic').toggle()
  end
end

vim.keymap.set({ 'n', 'v' }, '<leader>aa', function()
  open_agentic_if_closed()

  local mode = vim.fn.mode()
  if mode == 'v' or mode == 'V' or mode == '\022' then
    require('agentic').add_selection_or_file_to_context()
    return
  end

  if vim.bo.buftype == '' then
    require('agentic').add_selection_or_file_to_context()
  end
end, { desc = 'Open Agentic and add file/selection to context' })

vim.keymap.set({ 'n', 'v', 'i' }, '<leader>as', function() require('agentic').restore_session() end,
  { desc = 'Restore Agentic Session' })
vim.keymap.set({ 'n', 'v', 'i' }, '<leader>an', function() require('agentic').new_session() end,
  { desc = 'New Agentic Session' })
vim.keymap.set({ 'n', 'v', 'i' }, '<leader>ax', function() require('agentic').close() end,
  { desc = 'Close Agentic Window' })
