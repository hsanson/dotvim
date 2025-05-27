local opt = vim.opt_local

opt.autoindent = true
opt.expandtab = true
opt.tabstop = 8
opt.softtabstop = 2
opt.shiftwidth = 2
opt.textwidth = 0
opt.wrap = true
opt.linebreak = true

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<localleader>rr", function()
  require("autosave.actions").buf_enable()
  local linux_exe = "firefox"

  if vim.fn.executable(linux_exe) > 0 then
    vim.cmd("silent !" .. linux_exe .. " '" .. vim.fn.expand("%:p") .. "'")
  else
    vim.print("firefox binary not found, cannot preview asciidoc document")
  end
end, { silent = true, desc = "Preview", buffer = true })
