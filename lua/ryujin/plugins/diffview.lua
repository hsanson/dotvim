return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  lazy = true,
  enabled = false,
  opts = {
      hooks = {
        view_leave = function(view)
          view:close()
        end,
      },
      merge_tool = {
        disable_diagnostics = true,
      },
      file_history = {
        disable_diagnostics = true,
      }
  },
  keys = {
    {
      "<leader>dv", function()
        local tabpage = vim.api.nvim_get_current_tabpage()

        if not tabpage then
          return
        end

        local lib = require("diffview.lib")

        if lib.get_current_view() then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
        end
      end, desc = "Open Diffview" },

  }
}
