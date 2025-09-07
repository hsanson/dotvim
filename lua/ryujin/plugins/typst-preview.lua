return {
  "chomosuke/typst-preview.nvim",
  lazy = false, -- or ft = 'typst'
  version = "1.*",
  ft = "typst",
  config = function()
    vim.keymap.set("n", "<leader>rr", "<cmd>TypstPreview<cr>", {
      noremap = true,
      silent = true,
      desc = "Preview typst document",
    })
  end,
}
