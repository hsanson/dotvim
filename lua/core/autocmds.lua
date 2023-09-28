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
-- Transparency
-- Must be done before loading the color scheme
augroup('SyntaxGroup', {})

autocmd('ColorScheme', {
  group = 'SyntaxGroup',
  pattern = { '*' },
  callback = function()
    -- Force all colorschemes to have transparent background.
    vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'NONE', bg = 'NONE' })
    -- Force transparent background on floating windows.
    vim.api.nvim_set_hl(0, 'NormalFloat', { ctermbg = 'NONE', bg = 'NONE' })
    -- Force transparent background at the end of buffer
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { ctermbg = 'NONE', bg = 'NONE' })
    -- Make cursor line transparent so only the line number is
    -- hightlighted on the current line
    vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg = 'NONE', bg = 'NONE' })
    -- Highlight Japanese white spaces that can be source of cryptic bugs
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

-- ALE
--[[
augroup('ALEMappings', {})

autocmd('ALELSPStarted', {
  group = 'ALEMappings',
  callback = function()
    local keymap = vim.keymap

    keymap.set('n', 'gk', ':ALEDocumentation<cr>')
    keymap.set('n', 'gr', ':ALEFindReferences<cr>')
    keymap.set('n', 'gd', ':ALEGoToDefinition<cr>')
    keymap.set('n', 'gy', ':ALEGoToTypeDefinition<cr>')
    keymap.set('n', 'gh', ':ALEHover<cr>')
  end
})
--]]