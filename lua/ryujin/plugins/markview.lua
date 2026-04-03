return {
  "OXY2DEV/markview.nvim",
  ft = {
    "markdown", "AgenticChat", "latex",
    "yaml", "asciidoc", "typst", "opencode_output"
  },
  lazy = false,

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
        "opencode_output"
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
