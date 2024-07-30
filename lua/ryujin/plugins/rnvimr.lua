return {
  {
    "kevinhwang91/rnvimr",
    -- Load on startup so netwr hijack works when opening
    -- directories directly from command line.
    -- E.g. vim ./
    lazy = false,
    enable = false,
    keys = {
      { "-", "<cmd>RnvimrToggle<cr>", desc = "Open Ranger" }
    },
    config = function()
      vim.g.rnvimr_enable_ex = 1
      vim.g.rnvimr_enable_picker = 1
      vim.g.rnvimr_enable_bw = 1
      vim.g.rnvimr_vanilla = 0
    end
  }
}
