-------------------------------------------------------------------------------
-- Custom Mappings
-------------------------------------------------------------------------------
vim.keymap.set("n", "<space>", "<nop>", {})
vim.g["mapleader"] = " "
vim.g["maplocalleader"] = " "

-- Window Management
vim.keymap.set("n", "<leader>s", "<cmd>split<cr>", { desc = "Split window" })
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Vertical split window" })

-- Save and quit
vim.keymap.set("n", "<C-s>", "<cmd>:up<cr>", { desc = "Save buffer." })
vim.keymap.set("n", "<A-s>", "<cmd>:up<cr>", { desc = "Save buffer." })

-- Window Navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Jump left pane" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Jump below pane" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Jump above pane" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Jump right pane" })

-- Tab Navigation
vim.keymap.set("n", "<leader>tt", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })

-- Disable accidental Ex mode
vim.keymap.set("n", "Q", "<nop>", { desc = "Force quit neovim" })

-- Centered page scroll
vim.keymap.set("n", "<C-f>", "<C-d>zz", { desc = "Centered half-page down" })
vim.keymap.set("n", "<C-b>", "<C-u>zz", { desc = "Centered half-page up" })
vim.keymap.set("n", "<A-f>", "<C-d>zz", { desc = "Centered half-page down" })
vim.keymap.set("n", "<A-b>", "<C-u>zz", { desc = "Centered half-page up" })

-- Centered search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Primary clipboard copy via mouse
vim.keymap.set("v", "<LeftRelease>", '"*ygv')

-- Visual block move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual block up" })

-- Join lines
vim.keymap.set("n", "J", "mzJ'z", { desc = "Join lines without moving cursor" })

-- Paste without replacing register
vim.keymap.set("x", "p", "\"_dP", { desc = "Visual paste without replacing register" })
