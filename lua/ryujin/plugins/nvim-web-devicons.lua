return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    local devicons = require("nvim-web-devicons")

    devicons.setup({
      color_icons = true,
      default = true,
      strict = true,
    })
  end,
}
