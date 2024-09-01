local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-------------------------------------------------------------------------------
-- vim-android
augroup('GradleGroup', {})

autocmd('BufWrite', {
  group = 'GradleGroup',
  pattern = { 'build.gradle' },
  command = "call gradle#sync()"
})

-------------------------------------------------------------------------------
augroup('SyntaxGroup', {})

-- Highlight Zenkaku blank spaces
autocmd('ColorScheme', {
  group = 'SyntaxGroup',
  pattern = { '*' },
  callback = function()
    vim.api.nvim_set_hl(0, 'ZenkakuSpace', { fg = "lightgray", standout = true })
    vim.api.nvim_exec([[call matchadd('ZenkakuSpace', '[\u200B\u3000]')]], true)
  end
})

-- Highlight on yank
augroup('YankHighlight', { clear = true })

autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})
