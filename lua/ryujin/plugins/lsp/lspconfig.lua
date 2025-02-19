return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
    "barreiroleo/ltex_extra.nvim",
    "saghen/blink.cmp"
  },
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig/util")
    local keymap = vim.keymap
    local g = vim.g

    local opts = { noqemap = true, silent = true }

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        opts.buffer = ev.buf
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
        keymap.set("n", "<leader>gh", vim.lsp.buf.signature_help, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

        opts.desc = "LSP Format buffer"
        keymap.set('n', '<leader>gf', function()
          vim.lsp.buf.format { async = true }
        end, opts)

        -- Enable inlay hints if server supports them
        local id = vim.tbl_get(ev, 'data', 'client_id')
        local client = id and vim.lsp.get_client_by_id(id)
        if client and client.supports_method('textDocument/inlayHint') then
          vim.lsp.inlay_hint.enable(true, {bufnr = ev.buf})
        end
      end
    })

    local capabilities = vim.tbl_extend('keep',
      vim.lsp.protocol.make_client_capabilities(),
      require('blink.cmp').get_lsp_capabilities()
    )

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.WARN] = g.symbol_warn,
          [vim.diagnostic.severity.ERROR] = g.symbol_error,
          [vim.diagnostic.severity.INFO] = g.symbol_info,
          [vim.diagnostic.severity.HINT] = g.symbol_hint
        }
      }
    })

    -- Enable lsp debugging. Only enable when debugging to avoid
    -- performance degradation on normal use.
    -- vim.lsp.set_log_level("debug")

    lspconfig["cssls"].setup({
      capabilities = capabilities,
    })

    lspconfig["docker_compose_language_service"].setup({
      capabilities = capabilities,
    })

    lspconfig["dockerls"].setup({
      capabilities = capabilities,
    })

    lspconfig["gopls"].setup({
      capabilities = capabilities,
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true
          }
        }
      }
    })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
    })

    lspconfig["html"].setup({
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss" }
    })

    -- jdtls configuration is managed by nvim-jdtls plugin

    lspconfig["jedi_language_server"].setup({
      capabilities = capabilities,
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

    lspconfig["jsonls"].setup({
      capabilities = capabilities,
      settings = {
        json = {
          format = { enable = true },
          schemas = {
            {
              fileMatch = {
                "db/flows/*/questions.json"
              },
              url = ".fhir.schema.json"
            }
          }
        }
      }
    })

    -- Add kulala_ls as valid LSP to lsp-config
    local configs = require 'lspconfig.configs'

    if not configs.kulala_ls then
      configs.kulala_ls = {
        default_config = {
          cmd = { 'kulala-ls', '--stdio' },
          root_dir = lspconfig.util.root_pattern('http-client.env.json'),
          filetypes = { 'http' },
        },
      }
    end

    -- Configure kulala_ls
    lspconfig["kulala_ls"].setup({
      capabilities = capabilities,
    })

    -- lspconfig["kotlin_language_server"].setup({
    --   capabilities = capabilities,
    --   file_types = { "kotlin" },
    --   root_dir = function(fname)
    --     local root_files = {
    --       'settings.gradle', -- Gradle
    --       'settings.gradle.kts', -- Gradle
    --       'build.xml', -- Ant
    --       'pom.xml', -- Maven
    --     }

    --     local fallback_root_files = {
    --       'build.gradle', -- Gradle
    --       'build.gradle.kts', -- Gradle
    --     }

    --     local primary = lspconfig.util.root_pattern(unpack(root_files))(fname)
    --     local fallback = lspconfig.util.root_pattern(unpack(fallback_root_files))(fname)
    --     return primary or fallback
    --   end
    -- })

    lspconfig["harper_ls"].setup({
      settings = {
          ["harper-ls"] = {
            linters = {
              spell_check = true,
              spelled_numbers = false,
              an_a = true,
              sentence_capitalization = true,
              unclosed_quotes = true,
              wrong_quotes = false,
              long_sentences = true,
              repeated_words = true,
              spaces = true,
              matcher = true,
              correct_number_suffix = true,
              number_suffix_capitalization = true,
              multiple_sequential_pronouns = true
            }
          }
        },
    })

    lspconfig["ltex"].setup({
      capabilities = capabilities,
      filetypes = {
        "bib", "gitcommit", "markdown", "org", "plaintex", "rst",
        "rnoweb", "tex", "pandoc", "quarto", "rmd"
      },
      on_attach = function(client, bufnr)
        require("ltex_extra").setup({
          -- https://valentjn.github.io/ltex/supported-languages.html#natural-languages
          load_langs = { 'en-US', 'es', 'ja-JP' },
          init_check = true,
          path = vim.fn.expand("~") .. "/.config/ltex",
          -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
          log_level = "none",
          -- Not needed since lspconfig takes care of it
          server_opts = nil
        })
      end
    })

    -- neodev plugin must be setup before lspconfig lua_ls.
    require("neodev").setup({})

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          },
          diagnostics = {
            globals = { 'vim' }
          }
        }
      },
    })

    lspconfig["solargraph"].setup({
      capabilities = capabilities,
      settings = {
        solargraph = {
          diagnostics = true
        }
      }
    })

    lspconfig["vacuum"].setup({
      capabilities = capabilities,
      root_dir = util.root_pattern("vacuum.conf.yaml", ".git"),
      filetypes = {
        "yaml.openapi",
        "json.openapi",
        "openapi.yaml",
        "openapi.json"
      }
    })

    -- lspconfig["spectral"].setup({
    --   capabilities = capabilities,
    -- })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
    })

    lspconfig["terraformls"].setup({
      capabilities = capabilities,
    })

    lspconfig["texlab"].setup({
      capabilities = capabilities,
      settings = {
        texlab = {
          build = {
            onSave = true,
            auxDirectory = './out',
            logDirectory = './out',
            pdfDirectory = './out',
            executable = 'latexmk',
            args = {
              '-verbose',
              '-pdf',
              '-synctex=1',
              '-interaction=nonstopmode',
              '-auxdir=./out',
              '-outdir=./out',
              '%f'
            },
            forwardSearchAfter = true
          },
          chktex = {
            onEdit = true,
            onOpenAndSave = true
          },
          forwardSearch = {
            executable = 'zathura',
            args = { '--synctex-forward', "%l:1:%f", "%p" }
          }
        }
      }
    })

    lspconfig["vimls"].setup({
      capabilities = capabilities,
    })

    lspconfig["volar"].setup({
      capabilities = capabilities,
    })

    lspconfig["yamlls"].setup({
      capabilities = capabilities,
    })

  end
}
