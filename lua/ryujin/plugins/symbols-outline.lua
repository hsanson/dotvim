return {
  "simrat39/symbols-outline.nvim",
  config = function()
    local outline = require("symbols-outline")
    outline.setup({
      relative_width = true,
      width = 25,
      fold_markers = {"▸ ", ""},
      keymaps = {
        code_actions = "ca",
        unfold = "zo",
        unfold_all = "zO",
        fold = "zc",
        fold_all = "zC"
      }
    })
  end
}
