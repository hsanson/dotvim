return {
  "OXY2DEV/markview.nvim",
  ft = {
    "markdown", "AgenticChat", "latex",
    "yaml", "asciidoc", "typst",
    "opencode_output", "kulala_ui"
  },
  lazy = false,

  init = function()
    vim.treesitter.language.register("markdown", "kulala_ui")

    -- Kulala sets its response buffer filetype to "kulala_ui" but renders
    -- content as markdown. We register "kulala_ui" as a treesitter markdown
    -- parser alias so markview can parse it. However, markview must attach
    -- after kulala has written content and started the parser, so we defer
    -- the attach by 200ms to avoid a race condition.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "kulala_ui",
      callback = function(ev)
        vim.defer_fn(function()
          require("markview.actions").attach(ev.buf)
        end, 100)
      end,
    })
  end,

  opts = {
    preview = {
      enable_hybrid_mode = false,
      linewise_hybrid_mode = true,
      hybrid_modes = { "n" },
      filetypes = {
        "markdown",
        "AgenticChat",
        "latex",
        "yaml",
        "asciidoc",
        "typst",
        "opencode_output",
        "kulala_ui"
      },
      icon_provider = "mini",
    },
    yaml = {
      enable = false,
    },
    asciidoc = {
      list_items = {
        shift_width = 2,
        wrap = true,
      },
      document_attributes = {
        enable = false,
      },
      tocs = {
        enable = false,
      }
    }
  },
};
