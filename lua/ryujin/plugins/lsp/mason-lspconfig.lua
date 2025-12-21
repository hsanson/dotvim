return {
  "mason-org/mason-lspconfig.nvim",
  config = function()
    local lspconfig = require("mason-lspconfig")

    lspconfig.setup({
      ensure_installed = {
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "dockerls",
        "gopls",
        "graphql",
        "harper_ls",
        "html",
        "jdtls",
        "jedi_language_server",
        "jsonls",
        "kotlin_lsp",
        "ltex_plus",
        "lua_ls",
        "postgres_lsp",
        "rubocop",
        "ruby_lsp",
        "tailwindcss",
        "terraformls",
        "texlab",
        "tinymist",
        "vacuum",
        "vale_ls",
        "vimls",
      },
      automatic_installation = true,
      automatic_enable = false,
    })
  end,
}
