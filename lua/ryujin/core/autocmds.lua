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

-- Disable ALE in snacks picker input. This is required because for
-- some unknown reason if ALE is enabled with Neovim diagnostics then
-- when typing in live_grep provider the cursor gets moved randomly
-- one character back making typing impossible.
augroup('SnacksGroup', { clear = true })
autocmd('FileType', {
  group = 'SnacksGroup',
  pattern = { 'snacks_picker_input'},

-------------------------------------------------------------------------------
-- Support Ghostty progress bar
-- https://www.reddit.com/r/neovim/comments/1rcvliq/comment/o73wdkc/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.api.nvim_create_autocmd("LspProgress", {
    callback = function(ev)
        local value = ev.data.params.value or {}
        if not value.kind then return end

        local status = value.kind == "end" and 0 or 1
        local percent = value.percentage or 0

        local osc_seq = string.format("\27]9;4;%d;%d\a", status, percent)

        if os.getenv("TMUX") then
            osc_seq = string.format("\27Ptmux;\27%s\27\\", osc_seq)
        end

        io.stdout:write(osc_seq)
        io.stdout:flush()
    end,
})
