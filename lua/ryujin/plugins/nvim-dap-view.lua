return {
  'igorlfs/nvim-dap-view',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    local dapview = require('dap-view')

    dapview.setup({
      windows = {
        height = 20,
      },
      winbar = {
        show = true,
        -- You can add a "console" section to merge the terminal with the other views
        sections = {
          "watches", "scopes", "exceptions", "breakpoints",
          "sessions", "threads", "repl", "console"
        },
        -- Must be one of the sections declared above
        default_section = "repl",
        -- Configure each section individually
        base_sections = {
            breakpoints = {
                keymap = "B",
                label = "Breakpoints [B]",
                short_label = " [B]",
            },
            scopes = {
                keymap = "S",
                label = "Scopes [S]",
                short_label = "󰂥 [S]",
            },
            exceptions = {
                keymap = "E",
                label = "Exceptions [E]",
                short_label = "󰢃 [E]",
            },
            watches = {
                keymap = "W",
                label = "Watches [W]",
                short_label = "󰛐 [W]",
            },
            threads = {
                keymap = "T",
                label = "Threads [T]",
                short_label = "󱉯 [T]",
            },
            repl = {
                keymap = "R",
                label = "REPL [R]",
                short_label = "󰯃 [R]",
            },
            sessions = {
                keymap = "K", -- I ran out of mnemonics
                label = "Sessions [K]",
                short_label = " [K]",
            },
            console = {
                keymap = "C",
                label = "Console [C]",
                short_label = "󰆍 [C]",
            },
        },
        -- Add your own sections
        custom_sections = {},
        controls = {
            enabled = true,
            position = "right",
            buttons = {
                "play",
                "step_into",
                "step_over",
                "step_out",
                "step_back",
                "run_last",
                "terminate",
                "disconnect",
            },
            custom_buttons = {},
        },
      },
      icons = {
        disabled = "",
        disconnect = "",
        enabled = "",
        filter = "󰈲",
        negate = " ",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = "",
      },
      help = {
        border = nil,
      },
      auto_toggle = true,
      follow_tab = false,
    })

    -- Integration with DAP listeners for your tab-based workflow
    local dap = require('dap')

    local function find_or_create_tab(tab_name)
      local tabpages = vim.api.nvim_list_tabpages()
      local target_tab = nil

      -- Check if tab with this variable already exists
      for _, tab in ipairs(tabpages) do
        local success, tab_var = pcall(vim.api.nvim_tabpage_get_var, tab, "tab_name")
        if success and tab_var == tab_name then
          target_tab = tab
          break
        end
      end

      -- Switch to existing tab or create new one
      if target_tab then
        vim.api.nvim_set_current_tabpage(target_tab)
      else
        vim.cmd('tabnew')
        local current_tab = vim.api.nvim_get_current_tabpage()
        vim.api.nvim_tabpage_set_var(current_tab, "tab_name", tab_name)
      end
    end

    dap.listeners.before.attach.dapview_config = function()
      find_or_create_tab("DAP")
      dapview.open()
    end

    dap.listeners.before.launch.dapview_config = function()
      find_or_create_tab("DAP")
      dapview.open()
    end

    dap.listeners.before.event_terminated.dapview_config = function()
      dapview.close()
    end
  end
}
