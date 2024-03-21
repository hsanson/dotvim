return {
  dir = "/home/ryujin/Projects/vim/hurl.nvim",
  ft = "hurl",
  dev = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  opts = {
    -- Show debugging info
    debug = true,
    -- Show notification on run
    show_notification = true,
    -- Show response in popup or split
    mode = "split",
    auto_close = false,
    -- Default formatter
    formatters = {
      json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
      html = {
        'prettier', -- Make sure you have install prettier in your system, e.g: npm install -g prettier
        '--parser',
        'html',
      },
    },
  }
}
