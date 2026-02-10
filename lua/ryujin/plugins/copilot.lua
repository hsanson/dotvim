return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      -- Disable copilot.lua suggestions and panel modules
      -- that can interfere with completions from copilot-cmp
      suggestion = { enabled = false },
      panel = { enabled = false },
      -- Specify the model to use
      copilot_model = "gpt-41-copilot", -- Or "gpt-4o-copilot" or "gpt-35-turbo"
    })
  end,
}
