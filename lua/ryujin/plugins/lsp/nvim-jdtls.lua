return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/lsp-status.nvim"
  },
  config = function()

    local jdtls = require('jdtls')
    local mason = require("mason-registry")
    local lsp_status = require("lsp-status")

    -- Check if JDTLS is installed via Mason
    if not mason.is_installed("jdtls") then
      vim.notify(
        "jdtls: Mason jdtls package not installed, aborting",
        vim.log.levels.WARN
      )
      return
    end

    local java_path = "/usr/lib/jvm/java-17-amazon-corretto/bin/java"

    -- Check if java 17 is installed
    if not vim.loop.fs_stat(java_path) then
      vim.notify(
        "jdtls: JDK 17 binary not found, aborting",
        vim.log.levels.WARN
      )
      return
    end

    local mason_path = vim.fn.expand("$HOME/.local/share/nvim/mason")
    local root_path = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])

    local config = {
      cmd = { mason_path .. "/bin/jdtls" },
      root_dir = root_path,
      settings = {
        java = {
          jdt = {
            ls = {
              androidSupport = true,
              lombokSupport = true,
              protoBufSupport = true
            }
          }
        }
      }
    }

    local client_id = jdtls.start_or_attach(config)

    if client_id then
      local client = vim.lsp.get_client_by_id(client_id)
      lsp_status.register_progress()
      lsp_status.on_attach(client)
    end
  end
}
