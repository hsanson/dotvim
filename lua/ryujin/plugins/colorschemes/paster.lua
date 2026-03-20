return {
  "ankushbhagats/pastel.nvim",
  lazy = false,
  priority = 1000, -- load earlier
  config = function()
    require("pastel").setup(
      {
        style = {
          transparent = true,
        },
      }
    )
  end,
}
