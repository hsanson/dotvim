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
vim.keymap.set("n", "<C-x>", "<cmd>:up<cr>:qa<cr>", { desc = "Save & quit neovim" })
vim.keymap.set("n", "<A-s>", "<cmd>:up<cr>", { desc = "Save buffer." })
vim.keymap.set("n", "<A-x>", "<cmd>:up<cr>:qa<cr>", { desc = "Save & quit neovim" })

-- Window Navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Jump left pane" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Jump below pane" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Jump above pane" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Jump right pane" })

-- Tab Navigation
vim.keymap.set("n", "<leader>tt", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })

-- Remap number increment/decrement so it does not conflict with tmux
-- control keys (C-a)
vim.keymap.set("n", "<A-a>", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<A-x>", "<C-x>", { desc = "Decrement number" })

-- Disable accidental Ex mode
vim.keymap.set("n", "Q", "<nop>", { desc = "Force quit neovim" })

-- Page scroll on Mac
vim.keymap.set("n", "<A-f>", "<C-f>")
vim.keymap.set("n", "<A-b>", "<C-b>")

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Primary clipboard copy via mouse
vim.keymap.set("v", "<LeftRelease>", '"*ygv')
