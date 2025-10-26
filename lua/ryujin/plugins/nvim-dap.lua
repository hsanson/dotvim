return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'leoluz/nvim-dap-go',
  },
  config = function()

    local dap = require('dap')
    local dapgo = require('dap-go')
    local dapui = require('dap-view')

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
    end

    dap.listeners.before.launch.dapui_config = function()
      vim.cmd.tabnew('%')
      local w = math.floor(vim.api.nvim_win_get_width(0) * 40 / 100)
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
      vim.cmd.tabclose()
    end

    vim.cmd("hi DapBreakpointColor guifg=#ff6e5e")
    vim.cmd("hi DapRejectedColor guifg=#7b8496")
    vim.cmd("hi DapStoppedColor guifg=#f1ff5e")
    vim.fn.sign_define("DapBreakpoint", { text = "󰏃 ", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "󰏃 ", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "󰏃 ", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "󰏃 ", texthl = "DapRejectedColor", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = " ", texthl = "DapStoppedColor", linehl = "", numhl = "" })

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
  end
}
