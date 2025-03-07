vim.keymap.set('n', '<localleader>rr', function()

  vim.cmd("SwaggerPreview")

  local linux_exe = 'google-chrome'
  local mac_exe = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"

  if vim.fn.executable(linux_exe) >0
  then
    vim.cmd("silent !" .. linux_exe .. " http://localhost:8003")
  elseif vim.fn.executable(mac_exe)
  then
    vim.cmd("silent !" .. mac_exe .. " http://localhost:8003")
  end

end, { desc = "Preview OpenAPI", buffer = true })
