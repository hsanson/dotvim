return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = vim.g.package_installed,
          package_pending = vim.g.package_pending,
          package_uninstalled = vim.g.package_uninstalled
        },
        border = "rounded"
      }
    })

    lspconfig.setup({
      ensure_installed = {
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "gopls",
        "graphql",
        "html",
        "jdtls",
        "jedi_language_server",
        "jsonls",
        "kotlin_language_server",
        "ltex",
        "lua_ls",
        "solargraph",
        "spectral",
        "sqls",
        "tailwindcss",
        "terraformls",
        "texlab",
        "vimls",
        "volar",
        "yamlls",
      },
      automatic_installation = true
    })
  end
}
