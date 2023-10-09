return {
  'linrongbin16/lsp-progress.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'User LspProgressStatusUpdated',
  config = function()
    require('lsp-progress').setup()

    vim.api.nvim_create_autocmd("User", {
      group = vim.api.nvim_create_augroup("LualineLspProgressGroup", { clear = true }),
      pattern = 'LspProgressStatusUpdated',
      callback = require("lualine").refresh,
    })
  end
}
