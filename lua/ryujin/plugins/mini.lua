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
    require("mini.pairs").setup()
    require("mini.surround").setup()

    vim.keymap.set("n", "<Leader>dv", function()
      require("mini.diff").toggle_overlay()
    end, { desc = "Toggle mini diff overlay" })
  end,
}
