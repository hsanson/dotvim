-------------------------------------------------------------------------------
-- Custom Mappings
-------------------------------------------------------------------------------
vim.keymap.set('n', '<space>', '<nop>')
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window Management
vim.keymap.set('n', '<leader>s', '<cmd>split<cr>')
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<cr>')
vim.keymap.set('n', '<leader>x', '<cmd>close!<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>:wqa<cr>')

-- Window Navigation
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')

-- Tabs Navigation
vim.keymap.set('n', 'tt', '<cmd>tabnext<cr>')
vim.keymap.set('n', 'tn', '<cmd>tabnew<cr>')

-- Remap number increment/decrement so it does not conflict with tmux
-- control keys (C-a)
vim.keymap.set('n', '<A-a>', '<C-a>')
vim.keymap.set('n', '<A-x>', '<C-x>')

-- Disable accidental Ex mode
vim.keymap.set('n', 'Q', '<nop>')

-- Terminal
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', {noremap = true})
