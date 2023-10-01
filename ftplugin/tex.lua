local opt = vim.opt_local

opt.textwidth=0       -- Disable braking of long lines.
opt.wrap = true       -- Enable wrap of lines pass the right window border.
opt.linebreak = true  -- Force wrap at word boundaries not chars
opt.list = false      -- List command breaks soft wrapping.
opt.showbreak='…'
opt.spell = true

vim.keymap('n', 'j', 'gj')
vim.keymap('n', 'k', 'gk')

vim.keymap('n', '<leader>lv', '<cmd>VimtexView<cr>',
  { desc = "Preview latex document" })
vim.keymap('n', '<leader>ll', '<cmd>VimtexCompile<cr>',
  { desc = "Compile latex document" })

-- Enable concealed text that shows symbols like \beta as β
-- http://b4winckler.wordpress.com/2010/08/07/using-the-conceal-vim-feature-with-latex
opt.conceallevel = 2
