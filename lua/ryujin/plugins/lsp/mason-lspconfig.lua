return {
  "mason-org/mason-lspconfig.nvim",
  config = function()
    local lspconfig = require("mason-lspconfig")

    lspconfig.setup({
      ensure_installed = {
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "gopls",
        "graphql",
        "harper_ls",
        "html",
        "jdtls",
        "jedi_language_server",
        "jsonls",
        "ltex",
        "lua_ls",
        "rubocop",
        "ruby_lsp",
        "spectral",
        "tailwindcss",
        "terraformls",
        "texlab",
        "vale_ls",
        "vimls",
        "vacuum",
        "yamlls",
      },
      automatic_installation = true,
      automatic_enable = false,
    })
  end,
}
