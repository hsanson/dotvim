local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- vim-android
augroup('GradleGroup', {})

autocmd('BufWrite', {
  group = 'GradleGroup',
  pattern = { 'build.gradle' },
  command = "call gradle#sync()"
})
