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

-- Run help tags after Lazy update.
autocmd("User", {
  -- インストール、アップデート、または同期（Sync）の完了後に実行
  pattern = { "LazyInstall", "LazyUpdate", "LazySync" },
  callback = function()
    -- ヘルプタグの生成を実行
    vim.cmd("silent! helptags ALL")
    -- 完了を通知（任意）
    vim.notify("Updated helptags", vim.log.levels.INFO)
  end,
})
