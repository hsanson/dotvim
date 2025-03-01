return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'leoluz/nvim-dap-go',
    { 'igorlfs/nvim-dap-view', opts = {} }
  },
  config = function()

    local dap = require('dap')
    local dapgo = require('dap-go')
    local dapui = require('dap-view')
    local widgets = require('dap.ui.widgets')

    dapgo.setup()
    dapui.setup({
      windows = {
        height = 20,
        terminal = {
          hide = { "go" },
        }
      }
    })

    dap.listeners.before.attach.dapui_config = function()
      vim.cmd.tabnew('%')
      local w = math.floor(vim.api.nvim_win_get_width(0) * 40 / 100)
      dapui.open()
      widgets.sidebar(widgets.scopes, { width = w }).open()
    end

    dap.listeners.before.launch.dapui_config = function()
      vim.cmd.tabnew('%')
      local w = math.floor(vim.api.nvim_win_get_width(0) * 40 / 100)
      dapui.open()
      widgets.sidebar(widgets.scopes, { width = w }).open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
      vim.cmd.tabclose()
    end

    local opts = { noremap = true, silent = true, desc = "DAP continue" }
    vim.keymap.set('n', '<Left>', function() require('dap').continue() end, opts)
    opts.desc = "DAP step over"
    vim.keymap.set('n', '<Right>', function() require('dap').step_over() end, opts)
    opts.desc = "DAP step into"
    vim.keymap.set('n', '<Down>', function() require('dap').step_into() end, opts)
    opts.desc = "DAP step out"
    vim.keymap.set('n', '<Up>', function() require('dap').step_out() end, opts)
    opts.desc = "DAP toogle breakpoint"
    vim.keymap.set('n', '<leader>nt', function() require('dap').toggle_breakpoint() end, opts)
    opts.desc = "DAP watch"
    vim.keymap.set('n', '<leader>nw', function() require('dap').toggle_breakpoint() end, opts)
    opts.desc = "DAP hover"
    vim.keymap.set('n', '<leader>nh', function() require('dap.ui.widgets').hover() end, opts)
  end
}
