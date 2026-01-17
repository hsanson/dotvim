return {
  "wsdjeg/rooter.nvim",
  config = function()
    require("rooter").setup({
      root_patterns = { ".git/", "docker-compose.yml", "Dockerfile" },
      outermost = true,
      enable_cache = true,
      project_non_root = "current", -- this can be '', 'home' or 'current'
      enable_logger = true, -- enable runtime log via logger.nvim
      command = "tcd", -- cd, tcd or lcd
    })

    vim.keymap.set("n", "<leader>fp", function() require("snacks").picker.projects() end, {})
  end,
}
