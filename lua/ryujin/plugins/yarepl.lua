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
  },
  config = function()
    local yarepl = require("yarepl")

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

    local function run_cmd_with_count(cmd)
      return function()
        vim.cmd(string.format("%d%s", vim.v.count, cmd))
      end
    end

    local keymap = vim.api.nvim_set_keymap

    vim.keymap.set("n", "<localleader>re", function()
      local ft = vim.bo.filetype

      if ft == "ruby" then
        vim.cmd("REPLStart ruby")
      elseif ft == "python" then
        vim.cmd("REPLStart python")
      elseif ft == "sh" then
        vim.cmd("REPLStart bash")
      else
        vim.cmd("REPLStart")
      end

      vim.cmd(vim.api.nvim_replace_termcodes("normal <C-w><C-p>", true, true, true))
    end, { silent = true, desc = "Start an REPL" })

    keymap("v", "<localleader>rr", "", {
      callback = run_cmd_with_count("REPLSendVisual"),
      desc = "Send visual region",
    })

    keymap("n", "<localleader>rrr", "", {
      callback = run_cmd_with_count("REPLSendLine"),
      desc = "Send current line",
    })

    keymap("n", "<localleader>rr", "", {
      callback = run_cmd_with_count("REPLSendOperator"),
      desc = "Send motion",
    })

    keymap("n", "<localleader>rc", "<CMD>REPLCleanup<CR>", {
      desc = "Clear REPLs.",
    })
  end,
}
