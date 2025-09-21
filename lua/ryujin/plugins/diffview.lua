return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  lazy = true,
  config = function()
    local diff = require("diffview")
    diff.setup({
      hooks = {
        view_leave = function(view)
          view:close()
        end,
      },
    })
  end,
}
