-------------------------------------------------------------------------------
-- Custom Mappings
-------------------------------------------------------------------------------
vim.keymap.set('n', '<space>', '<nop>')
vim.g.mapleader = " "

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

-- Quick spell correcting
-- https://castel.dev/post/lecture-notes-1/
vim.keymap.set('i', '<C-s>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- Remap number increment/decrement so it does not conflict with tmux
-- control keys (C-a)
vim.keymap.set('n', '<A-a>', '<C-a>')
vim.keymap.set('n', '<A-x>', '<C-x>')

-- Disable accidental Ex mode
vim.keymap.set('n', 'Q', '<nop>')
