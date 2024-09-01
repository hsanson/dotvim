return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    dir_path = "img"
  },
  keys = {
    -- Suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
