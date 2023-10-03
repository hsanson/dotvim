local opt = vim.opt_local

opt.textwidth=0       -- Disable braking of long lines.
opt.wrap = true       -- Enable wrap of lines pass the right window border.
opt.linebreak = true  -- Force wrap at word boundaries not chars
opt.list = false      -- List command breaks soft wrapping.
opt.showbreak='…'
opt.spell = true

vim.keymap.set('n', 'j', 'gj', {})
vim.keymap.set('n', 'k', 'gk', {})

-- Enable concealed text that shows symbols like \beta as β
-- http://b4winckler.wordpress.com/2010/08/07/using-the-conceal-vim-feature-with-latex
opt.conceallevel = 2

-- Custom keymaps for texlab lsp
local opts = { noremap = true, silent = true }

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('TexlabLspConfig', {}),
  callback = function(ev)
    opts.buffer = ev.buf
    opts.desc = "Texlab build pdf"
    vim.keymap.set("n", "<leader>ll", "<cmd>TexlabBuild<CR>", opts)

    opts.desc = "Texlab view pdf"
    vim.keymap.set("n", "<leader>lv", "<cmd>TexlabForward<CR>", opts)
  end
})
