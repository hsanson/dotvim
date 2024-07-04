return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "nanotee/sqls.nvim",
    "folke/neodev.nvim",
    "barreiroleo/ltex_extra.nvim"
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap
    local g = vim.g

    local opts = { noremap = true, silent = true }

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
        keymap.set("n", "<leader>gh", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

        opts.desc = "LSP Format buffer"
        keymap.set('n', '<leader>gf', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end
    })

    local capabilities = vim.tbl_extend('keep',
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.default_capabilities()
    )

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.WARN] = g.symbol_warn,
          [vim.diagnostic.severity.ERROR] = g.symbol_error,
          [vim.diagnostic.severity.INFO] = g.symbol_info,
          [vim.diagnostic.severity.HINT] = g.symbol_hint
        },
        linehl = {
          [vim.diagnostic.severity.WARN] = "DiagnosticSign" .. g.symbol_warn,
          [vim.diagnostic.severity.ERROR] = "DiagnosticSign" .. g.symbol_error,
          [vim.diagnostic.severity.INFO] = "DiagnosticSign" .. g.symbol_info,
          [vim.diagnostic.severity.HINT] = "DiagnosticSign" .. g.symbol_hint
        },
        numhl = {
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = ""
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

    lspconfig["kotlin_language_server"].setup({
      capabilities = capabilities,
    })

    lspconfig["ltex"].setup({
      capabilities = capabilities,
      filetypes = {
        "bib", "gitcommit", "markdown", "org", "plaintex", "rst",
        "rnoweb", "tex", "pandoc", "quarto", "rmd", "asciidoc"
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

    lspconfig["spectral"].setup({
      capabilities = capabilities,
    })

    lspconfig["sqls"].setup({
      cmd = {"/home/ryujin/Projects/vim/sqls/sqls", "-l", "/tmp/sqls.log", "-t"},
      filetypes = { 'sql', 'mysql' },
      single_file_support = true,
      root_dir = function()
        return "/home/ryujin/.config/sqls"
      end,
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
      end
    })

    -- lspconfig["sqlls"].setup({
    --   cmd = { "sql-language-server", "up", "--method", "stdio", "-d" },
    --   enabled = false,
    --   capabilities = vim.tbl_extend(
    --     "force",
    --     capabilities,
    --     { executeCommandProvider = true, codeActionProvider = { resolveProvider = false } }
    --   ),
    --   on_attach = function(client, bufnr)

    --     vim.api.nvim_buf_create_user_command(bufnr, 'SqllsSwitchConnection', function(args)

    --       if not client then
    --         vim.notify('sqlls: Client is nil')
    --         return
    --       end

    --       -- Read project sqlls configuration and extract connection name if any
    --       local function get_project_config()
    --         local file = io.open(client.config.root_dir .. '/.sqllsrc.json', "r")
    --         if not file then return {} end
    --         local file_json = vim.json.decode(file:read("*a"), {})
    --         if not file_json then return {} end
    --         if not file_json.name then return {} end
    --         return {file_json.name}
    --       end

    --       -- Read personal sqlls configuration and extract all connections names
    --       -- if any
    --       local function get_personal_config()
    --         local config = vim.fn.expand("$HOME/.config/sql-language-server/.sqllsrc.json")
    --         local file = io.open(config, "r")
    --         if not file then return {} end
    --         local file_json = vim.json.decode(file:read("*a"), {})
    --         if not file_json then return {} end
    --         if not file_json.connections then return {} end
    --         return file_json.connections
    --       end

    --       -- Merge the names retrieved from personal and project configurations.
    --       local names = vim.tbl_map(function(val)
    --         return val.name
    --       end, get_personal_config())

    --       local all_names = vim.list_extend(names, get_project_config())

    --       vim.notify(vim.inspect(all_names))

    --       local function switchDatabase(name)
    --         client.request(
    --           'workspace/executeCommand',
    --           {
    --             command = "switchDataBaseConnection",
    --             arguments = name
    --           },
    --           function(err, result, _, _)
    --             if err then
    --               vim.notify('sqlls: ' .. err.message, vim.log.levels.ERROR)
    --               return
    --             end
    --             if not result then
    --               return
    --             end
    --             vim.notify('sqlls: ' .. result, vim.log.levels.DEBUG)
    --           end,
    --           bufnr
    --         )
    --       end

    --       vim.ui.select(all_names, {
    --         prompt = "Select connection:",
    --       }, function(choice)
    --         switchDatabase(choice)
    --       end)

    --     end, {})
    --   end
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
