-- vim-winmode: window resize/management mode (dev plugin, loaded from local source)
local dev = require('pack.util')
dev.load_dev('~/Projects/vim/vim-winmode')

vim.keymap.set('n', '<leader>w', '<cmd>WinModeStart<cr>', { desc = 'Start window mode' })
