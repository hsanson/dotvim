return {
  "mason-org/mason.nvim",
  config = function()
    local mason = require("mason")

    mason.setup({
      ui = {
        icons = {
          package_installed = vim.g["package_installed"],
          package_pending = vim.g["package_pending"],
          package_uninstalled = vim.g["package_uninstalled"],
        },
        border = "rounded",
      },
    })
  end,
}
