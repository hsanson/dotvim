return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  config = function()
    require("mcphub").setup({
      -- Configuration for MCP servers
      config = vim.fn.expand("~/.config/mcphub/servers.json"),
      port = 37373,
      auto_approve = false,
      auto_toggle_mcp_servers = true,
    })
  end,
}
