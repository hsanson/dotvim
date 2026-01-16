return {
  "NickvanDyke/opencode.nvim",
  enabled = true,
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    {
      "folke/snacks.nvim",
      opts = {
        picker = {},
        input = {
          enabled = true,
        },
        terminal = {
          win = {
            position = "float",
            relative = "editor",
            row = -1,
            width = 0.4,
            border = "rounded",
          }
        }
      },
    },
  },
  config = function()
    -- Declare vim globals for type checking
    local vim = vim

    vim.g.opencode_opts = {
      providers = {
        enabled = "snacks",
      },
      ask = {
        snacks = {
          expand = false,  -- Disable auto-expansion to prevent overlap
          win = {
            relative = "win",      -- Relative to current window, not cursor
            position = "float",
            border = "rounded",
            width = 0.9,           -- 90% of current window width
            height = 10,           -- Fixed 10 lines height (more vertical space)
            row = -3,              -- Position 3 rows from bottom
            col = 0.05,            -- Center horizontally (0.5 - 0.9/2 = 0.05 offset)
            backdrop = false,
            zindex = 50,
            wo = {
              winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
              cursorline = false,
            },
            bo = {
              filetype = "snacks_input",
              buftype = "prompt",
            },
          },
        },
      },
    }

    -- Required for `opts.auto_reload`.
    vim.o.autoread = true

    -- Recommended/example keymaps.
    vim.keymap.set({ "n", "x" }, "<leader>aa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<leader>as", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "x" },    "ga", function() require("opencode").prompt("@this") end,                   { desc = "Add to opencode" })
    vim.keymap.set({ "n", "t" }, "<leader>ao", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })
    vim.keymap.set("n",        "<PageUp>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" })
    vim.keymap.set("n",        "<PageDown>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })
  end,
}
