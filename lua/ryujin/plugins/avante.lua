return {
  "yetone/avante.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  build = function()
    return "make BUILD_FROM_SOURCE=true"
  end,
  event = "VeryLazy",
  version = false,
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    provider = "copilot",
    auto_suggestions = false,
    providers = {
      copilot = {
        model = "claude-sonnet-4-20250514",
      },
    },
    web_search_engine = {
      provider = "brave",
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
  },
}
