local opt = vim.opt_local

opt.autoindent = true
opt.expandtab  = true
opt.tabstop = 8
opt.softtabstop = 2
opt.shiftwidth = 2
opt.textwidth = 0
opt.wrap = true
opt.linebreak = true
opt.spell = true

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<leader>lv', function()
  vim.cmd("!google-chrome '" .. vim.fn.expand("%:p") .. "'")
end, { silent = true })
