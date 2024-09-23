local opt = vim.opt_local

opt.linebreak = true

vim.keymap.set('n', '<leader>rr', function()
  require('autosave.actions').buf_enable()
  vim.cmd("!google-chrome '" .. vim.fn.expand("%:p") .. "'")
end, { silent = true })
