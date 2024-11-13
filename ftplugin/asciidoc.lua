local opt = vim.opt_local

opt.autoindent = true
opt.expandtab  = true
opt.tabstop = 8
opt.softtabstop = 2
opt.shiftwidth = 2
opt.textwidth = 0
opt.wrap = true
opt.linebreak = true

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<leader>rr', function()
  require('autosave.actions').buf_enable()

  local linux_exe = 'google-chrome'
  local mac_exe = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"

  if vim.fn.executable(linux_exe) >0
  then
    vim.cmd("silent !" .. linux_exe .. " '" .. vim.fn.expand("%:p") .. "'")
  elseif vim.fn.executable(mac_exe)
  then
    vim.cmd("silent !" .. mac_exe .. " '" .. vim.fn.expand("%:p") .. "'")
  end
end, { silent = true, desc = "Preview" })
