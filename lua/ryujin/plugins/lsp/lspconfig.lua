return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
  },
  config = function()
    local keymap = vim.keymap
    local g = vim.g

    local opts = { noremap = true, silent = true }

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        opts.buffer = ev.buf
        opts.desc = "Show LSP references"
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

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

        opts.desc = "LSP Format buffer"
        keymap.set("n", "<leader>gf", function()
          vim.lsp.buf.format({ async = true })
        end, opts)

        -- Enable inlay hints if server supports them
        local id = vim.tbl_get(ev, "data", "client_id")
        local client = id and vim.lsp.get_client_by_id(id)
        if client and client:supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
      end,
    })

    local capabilities = vim.tbl_extend(
      "keep",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.WARN] = g.symbol_warn,
          [vim.diagnostic.severity.ERROR] = g.symbol_error,
          [vim.diagnostic.severity.INFO] = g.symbol_info,
          [vim.diagnostic.severity.HINT] = g.symbol_hint,
        },
      },
    })

    -- Enable lsp debugging. Only enable when debugging to avoid
    -- performance degradation on normal use.
    -- vim.lsp.set_log_level("debug")

    vim.lsp.config("cssls", {
      capabilities = capabilities,
    })

    vim.lsp.config("docker_compose_language_service", {
      capabilities = capabilities,
    })

    vim.lsp.config("dockerls", {
      capabilities = capabilities,
    })

    vim.lsp.config("gopls", {
      capabilities = capabilities,
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    })

    vim.lsp.config("graphql", {
      capabilities = capabilities,
    })

    vim.lsp.config("html", {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss" },
    })

    -- JDTLS configuration is managed by nvim-jdtls plugin

    vim.lsp.config("jedi_language_server", {
      capabilities = capabilities,
    })

    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      settings = {
        json = {
          format = { enable = true },
          schemas = {
            {
              fileMatch = {
                "db/flows/*/questions.json",
              },
              url = ".fhir.schema.json",
            },
          },
        },
      },
    })

    -- Add kulala_ls as valid LSP to lsp-config
    local configs = require("lspconfig.configs")

    if not configs.kulala_ls then
      configs.kulala_ls = {
        default_config = {
          cmd = { "kulala-ls", "--stdio" },
          root_markers = { "http-client.env.json" },
          filetypes = { "http" },
        },
      }
    end

    -- Configure tinymist
    vim.lsp.config("tinymist", {
      settings = {
        formatterMode = "typstyle",
        exportPdf = "onType",
        semanticTokens = "disable",
      },
    })

    -- Configure kulala_ls
    vim.lsp.config("kulala_ls", {
      capabilities = capabilities,
    })

    -- harper: ignore
    -- vim.lsp.config("kotlin_language_server", {
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

    vim.lsp.config("vale_ls", {
      capabilities = capabilities,
      root_markers = { ".vale.ini", ".git" },
      settings = {
        filetypes = { "markdown", "text", "tex", "rst", "asciidoc" },
      },
    })

    vim.lsp.config("harper_ls", {
      capabilities = capabilities,
      settings = {
        ["harper-ls"] = {
          linters = {
            isolateEnglish = true,
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
            multiple_sequential_pronouns = true,
          },
        },
      },
    })

    -- neodev plugin must be setup before lspconfig lua_ls.
    require("neodev").setup()

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    vim.lsp.config("ruby_lsp", {
      capabilities = capabilities,
      init_options = {
        enabledFeatures = {
          "documentSymbols",
          "foldingRanges",
          "selectionRanges",
          "semanticHighlighting",
          "completion",
          "hover",
          "signatureHelp",
          "definition",
          "typeDefinition",
          "implementation",
          "references",
          "documentHighlight",
          "codeAction",
          "codeLens",
          "formatting",
          "onTypeFormatting",
          "rename",
          "diagnostics",
          "inlayHints",
          "workspaceSymbol",
          "documentLink",
          "callHierarchy",
          "executeCommand",
        },
        formatter = "standard",
        linters = { "standard" },
      },
    })

    vim.lsp.config("vacuum", {
      capabilities = capabilities,
      root_markers = { "vacuum.conf.yaml", ".git" },
      cmd = { "vacuum", "language-server", "--config", "vacuum.conf.yaml", "--ignore-file", "vacuum.ignore.yaml" },
      filetypes = {
        "yaml.openapi",
        "json.openapi",
        "openapi.yaml",
        "openapi.json",
      },
    })

    -- vim.lsp.config("spectral", {
    --   capabilities = capabilities,
    -- })

    vim.lsp.config("tailwindcss", {
      capabilities = capabilities,
    })

    vim.lsp.config("terraformls", {
      capabilities = capabilities,
    })

    vim.lsp.config("texlab", {
      capabilities = capabilities,
      settings = {
        texlab = {
          build = {
            onSave = true,
            auxDirectory = "./out",
            logDirectory = "./out",
            pdfDirectory = "./out",
            executable = "latexmk",
            args = {
              "-verbose",
              "-pdf",
              "-synctex=1",
              "-interaction=nonstopmode",
              "-auxdir=./out",
              "-outdir=./out",
              "%f",
            },
            forwardSearchAfter = true,
          },
          chktex = {
            onEdit = true,
            onOpenAndSave = true,
          },
          forwardSearch = {
            executable = "zathura",
            args = { "--synctex-forward", "%l:1:%f", "%p" },
          },
        },
      },
    })

    vim.lsp.config("vimls", {
      capabilities = capabilities,
    })

    vim.lsp.config("vue_ls", {
      capabilities = capabilities,
    })

    vim.lsp.enable({
      "cssls",
      "docker_compose_language_service",
      "dockerls",
      "gopls",
      "graphql",
      "html",
      "jedi_language_server",
      "jsonls",
      "tinymist",
      "kulala_ls",
      "kotlin_language_server",
      "vale_ls",
      "harper_ls",
      "lua_ls",
      "ruby_lsp",
      "vacuum",
      "spectral",
      "tailwindcss",
      "terraformls",
      "texlab",
      "vimls",
      "vue_ls",
    })
  end,
}
