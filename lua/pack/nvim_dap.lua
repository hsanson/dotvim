-- DAP dependencies loaded first
vim.pack.add({ 'https://github.com/leoluz/nvim-dap-go' }, { load = true })
vim.pack.add({ 'https://github.com/theHamsta/nvim-dap-virtual-text' }, { load = true })

vim.pack.add({ 'https://github.com/mfussenegger/nvim-dap' }, { load = true })

local dap = require('dap')
local dapgo = require('dap-go')

dapgo.setup({
  delve = {
    detached = false,
  },
})

local function find_or_create_tab(tab_name)
  local tabpages = vim.api.nvim_list_tabpages()
  local target_tab = nil

  for _, tab in ipairs(tabpages) do
    local success, tab_var = pcall(vim.api.nvim_tabpage_get_var, tab, 'tab_name')
    if success and tab_var == tab_name then
      target_tab = tab
      break
    end
  end

  if target_tab then
    vim.api.nvim_set_current_tabpage(target_tab)
  else
    vim.cmd('tabnew')
    local current_tab = vim.api.nvim_get_current_tabpage()
    vim.api.nvim_tabpage_set_var(current_tab, 'tab_name', tab_name)
  end
end

dap.defaults.fallback.switchbuf = function(bufnr, line, col)
  find_or_create_tab('DAP')
  local current_tab = vim.api.nvim_get_current_tabpage()
  local wins = vim.api.nvim_tabpage_list_wins(current_tab)
  if #wins > 0 then
    local first_win = wins[1]
    vim.api.nvim_win_set_buf(first_win, bufnr)
    vim.api.nvim_win_set_cursor(first_win, { line, col })
    vim.api.nvim_set_current_win(first_win)
  end
end

dap.listeners.before.attach.dapui_config = function()
  find_or_create_tab('DAP')
end

dap.listeners.before.launch.dapui_config = function()
  find_or_create_tab('DAP')
end

dap.listeners.before.event_terminated.dapui_config = function()
  find_or_create_tab('DAP')
  vim.cmd.tabclose()
end

vim.cmd('hi DapBreakpointColor guifg=#ff6e5e')
vim.cmd('hi DapRejectedColor guifg=#7b8496')
vim.cmd('hi DapStoppedColor guifg=#f1ff5e')
vim.fn.sign_define('DapBreakpoint', { text = '󰏃 ', texthl = 'DapBreakpointColor', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '󰏃 ', texthl = 'DapBreakpointColor', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '󰏃 ', texthl = 'DapBreakpointColor', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '󰏃 ', texthl = 'DapRejectedColor', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = ' ', texthl = 'DapStoppedColor', linehl = '', numhl = '' })

local opts = { noremap = true, silent = true, desc = 'DAP continue' }
vim.keymap.set('n', '<Left>', function() require('dap').continue() end, opts)
opts.desc = 'DAP step over'
vim.keymap.set('n', '<Right>', function() require('dap').step_over() end, opts)
opts.desc = 'DAP step into'
vim.keymap.set('n', '<Down>', function() require('dap').step_into() end, opts)
opts.desc = 'DAP step out'
vim.keymap.set('n', '<Up>', function() require('dap').step_out() end, opts)
opts.desc = 'DAP toggle breakpoint'
vim.keymap.set('n', '<leader>nt', function() require('dap').toggle_breakpoint() end, opts)
opts.desc = 'DAP watch'
vim.keymap.set('n', '<leader>nw', function() require('dap').toggle_breakpoint() end, opts)
