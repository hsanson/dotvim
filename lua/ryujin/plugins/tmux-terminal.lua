return {
  dir = "~/Projects/vim/tmux-terminal.nvim",
  dev = true,
  lazy = false,
  opts = {},
  keys = {
    {
      "<leader>te",
      mode = { "n" },
      "<cmd>TmuxTerm<cr>",
      desc = "Toggle tmux terminal",
    },
  },
}
