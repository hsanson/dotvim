return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      opts.desc = "Show code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "Got to previous diagnostics"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Got to next diagnostics"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      opts.desc = "Show documentation"
      keymap.set("n", "]d", vim.lsp.buf.hover, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss" }
    })

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["docker_compose_language_service"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["dockerls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["jdtls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["jedi_language_server"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["kotlin_language_server"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true
            }
          }
        }
      }
    })

    lspconfig["ruby_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["sqlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["terraformls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["texlab"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["vimls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["volar"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })
  end
}
