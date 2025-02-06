return {
  {
    "ramilito/kubectl.nvim",
    config = function()
      require("kubectl").setup({
         kubectl_cmd = { cmd = "kubectl", env = { AWS_PROFILE = vim.env.AWS_PROFILE }, args = {}, persist_context_change = false }
      })

      vim.keymap.set("n", "<leader>'",
        '<cmd>lua require("kubectl").toggle()<cr>',
        { noremap = true, silent = true })
    end,
  },
}
