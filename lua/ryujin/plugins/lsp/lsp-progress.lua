return {
  'linrongbin16/lsp-progress.nvim',
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
