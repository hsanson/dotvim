return {
  {
    "kevinhwang91/rnvimr",
    keys = {
      { "-", "<cmd>RnvimrToggle<cr>", desc = "Open Ranger" }
    },
    config = function()
      vim.g.rnvimr_enable_ex = 1
      vim.g.rnvimr_enable_picker = 1
      vim.g.rnvimr_enable_bw = 1
    end
  }
}
