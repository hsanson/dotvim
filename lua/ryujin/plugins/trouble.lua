return {
  "folke/trouble.nvim",
  specs = {
    "folke/snacks.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          actions = require("trouble.sources.snacks").actions,
          win = {
            input = {
              keys = {
                ["<c-q>"] = {
                  "trouble_open",
                  mode = { "n", "i" },
                },
              },
            },
          },
        },
      })
    end,
  },
  opts = {},
  cmd = "Trouble",
  keys = (function()
    ---Switch to a trouble mode in a single bottom pane, replacing whatever is
    ---currently shown. If the requested mode is already open, toggle it closed.
    ---@param mode string
    ---@param extra? table
    local function trouble_toggle(mode, extra)
      return function()
        local trouble = require("trouble")
        -- If the requested mode is already visible, just close it.
        if trouble.is_open(mode) then
          trouble.close()
          return
        end
        -- Close any other trouble window first so we reuse the same pane.
        if trouble.is_open() then
          trouble.close()
        end
        local opts = vim.tbl_extend("force", { mode = mode, new = false }, extra or {})
        trouble.open(opts)
      end
    end

    return {
      {
        "<leader>xx",
        trouble_toggle("diagnostics"),
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        trouble_toggle("diagnostics", { filter = { buf = 0 } }),
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        trouble_toggle("symbols", { focus = false }),
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        trouble_toggle("lsp", { focus = false }),
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        trouble_toggle("loclist"),
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        trouble_toggle("qflist"),
        desc = "Quickfix List (Trouble)",
      },
      {
        "<leader>xp",
        function()
          local snacks_src = require("trouble.sources.snacks")
          if not snacks_src.items or #snacks_src.items == 0 then
            vim.notify("No previous picker selections", vim.log.levels.WARN)
            return
          end
          trouble_toggle(snacks_src.mode())()
        end,
        desc = "Restore picker selections (Trouble)",
      },
    }
  end)(),
}
