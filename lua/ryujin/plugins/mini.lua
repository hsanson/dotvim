return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    require("mini.pairs").setup()
    require("mini.surround").setup()
  end,
}
