return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    require("mini.ai").setup()
    require("mini.diff").setup({
      view = {
        style = "sign",
      },
    })
  end,
}
