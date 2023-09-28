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
          package_installed = "",
          package_pending = "",
          package_uninstalled = ""
        }
      }
    })

    lspconfig.setup({
      ensure_installed = {
        "texlab",
        "terraformls",
        "vimls",
        "yamlls",
        "volar",
        "sqlls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "graphql",
        "html",
        "jdtls",
        "kotlin_language_server",
        "lua_ls",
        "jedi_language_server",
        "ruby_ls",
        "tailwindcss"
      },
      automatic_installation = true
    })
  end
}
