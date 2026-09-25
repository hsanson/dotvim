local opt = vim.opt_local

opt.linebreak = true

vim.keymap.set("n", "<localleader>rr", function()
  vim.cmd("silent! Vellum")
end, { silent = true, desc = "Preview", buffer = true })
