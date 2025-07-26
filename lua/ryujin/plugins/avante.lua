return {
  "yetone/avante.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  build = "make",
  event = "VeryLazy",
  version = false,
  config = function()
    local avante = require("avante")
    local hub = require("mcphub")

    avante.setup({
      provider = "copilot",
      auto_suggestions = false,
      providers = {
        copilot = {
          model = "claude-sonnet-4",
        },
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
      disabled_tools = {
        "list_files", -- Built-in file operations
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash",
        "web_search", -- Disable built-in web search to use DuckDuckGo MCP instead
      },
      behaviour = {
        auto_suggestions = false,
      },
      windows = {
        position = "right",
        wrap = true,
        width = 40,
        sidebar_header = {
          enabled = false,
        },
        input = {
          prefix = "> ",
          height = 20,
        },
      },
    })
  end,
}
