return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "nanotee/sqls.nvim",
    "nvim-lua/lsp-status.nvim"
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lsp_status = require("lsp-status")
    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }

    local set_keymaps = function(bufnr)
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

    local capabilities = vim.tbl_extend('keep',
      cmp_nvim_lsp.default_capabilities(),
      lsp_status.capabilities
    )

    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Registere lsp-status progress handler
    lsp_status.register_progress()

    -- Enable lsp debugging
    vim.lsp.set_log_level("debug")

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss" }
    })

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["docker_compose_language_service"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["dockerls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["jsonls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["spectral"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["jedi_language_server"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
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

    lspconfig["ltex"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["ruby_ls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["sqls"].setup({
      deprecate = false,
      root_dir = function()
        return "/home/ryujin/Projects/Sql/jointriage_pro_db"
      end,
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
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
    --     set_keymaps(bufnr)

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
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["terraformls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["texlab"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["vimls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["volar"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["kotlin_language_server"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        lsp_status.on_attach(client)
        set_keymaps(bufnr)
      end,
    })
  end
}
