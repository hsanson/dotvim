return {
  --
  -- REPL
  -- <leader>cs to open REPL
  -- <leader>cr in visual mode or with motion to send to REPL
  -- <leader>crr to send current line.
  --
  "milanglacier/yarepl.nvim",
  enabled = true,
  ft = {
    "python",
    "ruby",
    "sh",
    "sql",
  },
  config = function()
    local yarepl = require("yarepl")
    local usql = require("usql.yarepl")

    yarepl.setup({
      -- see `:h buflisted`, whether the REPL buffer should be buflisted.
      buflisted = false,
      -- whether the REPL buffer should be a scratch buffer.
      scratch = false,
      -- the filetype of the REPL buffer created by `yarepl`
      ft = "REPL",
      -- How yarepl open the REPL window, can be a string or a lua function.
      -- See below example for how to configure this option
      wincmd = "belowright 20 split",
      -- The available REPL palattes that `yarepl` can create REPL based on
      metas = {
        aichat = { cmd = "aichat", formatter = yarepl.formatter.bracketed_pasting },
        radian = { cmd = "radian", formatter = yarepl.formatter.bracketed_pasting },
        python = { cmd = "ipython", formatter = yarepl.formatter.bracketed_pasting },
        R = { cmd = "R", formatter = yarepl.formatter.trim_empty_lines },
        bash = { cmd = "bash", formatter = yarepl.formatter.trim_empty_lines },
        zsh = { cmd = "zsh", formatter = yarepl.formatter.bracketed_pasting },
        ruby = { cmd = "pry", formatter = yarepl.formatter.trim_empty_lines },
        usql = { cmd = usql.cmd, formatter = usql.formatter },
      },
      -- when a REPL process exits, should the window associated with those REPLs closed?
      close_on_exit = true,
      -- whether automatically scroll to the bottom of the REPL window after sending
      -- text? This feature would be helpful if you want to ensure that your view
      -- stays updated with the latest REPL output.
      scroll_to_bottom_after_sending = true,
      os = {
        -- Some hacks for Windows. macOS and Linux users can simply ignore
        -- them. The default options are recommended for Windows user.
        windows = {
          -- Send a final `\r` to the REPL with delay,
          send_delayed_final_cr = true,
        },
      },
    })
  end,
}
