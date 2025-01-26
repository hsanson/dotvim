return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  config = function()
    local presets = require("markview.presets")

    require("markview").setup({
      markdown = {
        headings = presets.headings.marker
      }
    });
  end
}
