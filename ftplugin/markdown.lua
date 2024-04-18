local opt = vim.opt_local

opt.linebreak = true

vim.keymap.set('n', '<leader>rr', function()
  vim.cmd("!google-chrome '" .. vim.fn.expand("%:p") .. "'")
end, { silent = true })
