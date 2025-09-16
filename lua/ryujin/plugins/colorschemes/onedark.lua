return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("onedark").setup({
      transparent = true,
      -- styles: dark, darker, cool, deep, warm, warmer, light
      style = "darker",
    })
  end,
}
