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
      copilot_model = "sonnet-4.0",  -- Or "sonnet-3.7"
    })
  end,
}
