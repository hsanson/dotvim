return {
  -- "cousine/opencode-context.nvim",
  dir = "~/Projects/vim/opencode-context.nvim",
  dev = true,
  opts = {
    tmux_target = nil, -- Manual override: "session:window.pane"
    auto_detect_pane = true, -- Auto-detect opencode pane in current window
  },
  keys = {
    { "<leader>aa", "<cmd>OpencodeSend<cr>", desc = "Send prompt to opencode" },
    { "<leader>aa", "<cmd>OpencodeSend<cr>", mode = "v", desc = "Send prompt to opencode" },
    { "<leader>aA", "<cmd>OpencodePrompt<cr>", desc = "Open opencode persistent prompt" },
    { "<leader>at", "<cmd>OpencodeSwitchMode<cr>", desc = "Toggle opencode mode" },
  },
  cmd = { "OpencodeSend", "OpencodeSwitchMode" },
}
