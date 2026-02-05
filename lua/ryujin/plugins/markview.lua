return {
  "OXY2DEV/markview.nvim",
  ft = { "markdown", "AgenticChat", "latex", "yaml", "asciidoc", "typst" },
  lazy = false,

  opts = {
    preview = {
      filetypes = { "markdown", "AgenticChat", "latex", "yaml", "asciidoc", "typst" },
      icon_provider = "mini",
    },
    yaml = {
      enable = false,
    },
    asciidoc = {
      document_attributes = {
        enable = false,
      },
      tocs = {
        enable = false,
      }

    }
  },
};
