-- Requires nvim-dap to already be loaded (via pack.nvim_dap)
vim.pack.add({ 'https://github.com/igorlfs/nvim-dap-view' }, { load = true })

local dapview = require('dap-view')

dapview.setup({
  winbar = {
    show = true,
    sections = {
      'watches', 'scopes', 'exceptions', 'breakpoints',
      'sessions', 'threads', 'repl', 'console',
    },
    default_section = 'repl',
    base_sections = {
      breakpoints = { keymap = 'B', label = 'Breakpoints [B]' },
      scopes = { keymap = 'S', label = 'Scopes [S]' },
      exceptions = { keymap = 'E', label = 'Exceptions [E]' },
      watches = { keymap = 'W', label = 'Watches [W]' },
      threads = { keymap = 'T', label = 'Threads [T]' },
      repl = { keymap = 'R', label = 'REPL [R]' },
      sessions = { keymap = 'K', label = 'Sessions [K]' },
      console = { keymap = 'C', label = 'Console [C]' },
    },
    custom_sections = {},
    controls = {
      enabled = true,
      position = 'right',
      buttons = {
        'play', 'step_into', 'step_over', 'step_out',
        'step_back', 'run_last', 'terminate', 'disconnect',
      },
      custom_buttons = {},
    },
  },
  icons = {
    disabled = '',
    disconnect = '',
    enabled = '',
    filter = '󰈲',
    negate = ' ',
    pause = '',
    play = '',
    run_last = '',
    step_back = '',
    step_into = '',
    step_out = '',
    step_over = '',
    terminate = '',
  },
  help = { border = nil },
  auto_toggle = true,
  follow_tab = false,
})

local dap = require('dap')

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

dap.listeners.before.attach.dapview_config = function()
  find_or_create_tab('DAP')
  dapview.open()
end

dap.listeners.before.launch.dapview_config = function()
  find_or_create_tab('DAP')
  dapview.open()
end

dap.listeners.before.event_terminated.dapview_config = function()
  dapview.close()
end
