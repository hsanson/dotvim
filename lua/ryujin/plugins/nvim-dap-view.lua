return {
  'igorlfs/nvim-dap-view',
  opts = {
    winbar = {
        show = true,
        -- You can add a "console" section to merge the terminal with the other views
        sections = {
          "watches", "scopes", "exceptions", "breakpoints", "sessions", "threads", "repl"
        },
        -- Must be one of the sections declared above
        default_section = "scopes",
        -- Configure each section individually
        base_sections = {
            breakpoints = {
                keymap = "B",
                label = "Breakpoints [B]",
                short_label = " [B]",
                action = function()
                    require("dap-view.views").switch_to_view("breakpoints")
                end,
            },
            scopes = {
                keymap = "S",
                label = "Scopes [S]",
                short_label = "󰂥 [S]",
                action = function()
                    require("dap-view.views").switch_to_view("scopes")
                end,
            },
            exceptions = {
                keymap = "E",
                label = "Exceptions [E]",
                short_label = "󰢃 [E]",
                action = function()
                    require("dap-view.views").switch_to_view("exceptions")
                end,
            },
            watches = {
                keymap = "W",
                label = "Watches [W]",
                short_label = "󰛐 [W]",
                action = function()
                    require("dap-view.views").switch_to_view("watches")
                end,
            },
            threads = {
                keymap = "T",
                label = "Threads [T]",
                short_label = "󱉯 [T]",
                action = function()
                    require("dap-view.views").switch_to_view("threads")
                end,
            },
            repl = {
                keymap = "R",
                label = "REPL [R]",
                short_label = "󰯃 [R]",
                action = function()
                    require("dap-view.repl").show()
                end,
            },
            sessions = {
                keymap = "K", -- I ran out of mnemonics
                label = "Sessions [K]",
                short_label = " [K]",
                action = function()
                    require("dap-view.views").switch_to_view("sessions")
                end,
            },
            console = {
                keymap = "C",
                label = "Console [C]",
                short_label = "󰆍 [C]",
                action = function()
                    require("dap-view.views").switch_to_view("console")
                end,
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
    windows = {
        height = 0.25,
        position = "below",
        terminal = {
            width = 0.5,
            position = "left",
            -- List of debug adapters for which the terminal should be ALWAYS hidden
            hide = {},
            -- Hide the terminal when starting a new session
            start_hidden = true,
        },
    },
    icons = {
        disabled = "",
        disconnect = "",
        enabled = "",
        filter = "󰈲",
        negate = " ",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = "",
    },
    help = {
        border = nil,
    },
    switchbuf = "usetab,uselast",
    auto_toggle = true,
    follow_tab = false,
  },
}
