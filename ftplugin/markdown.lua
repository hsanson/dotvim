local opt = vim.opt_local

opt.linebreak = true

vim.keymap.set("n", "<localleader>rr", function()
  vim.cmd("silent! LivePreview start")
end, { silent = true, desc = "Preview", buffer = true })
