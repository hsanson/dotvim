local opt = vim.opt_local

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.foldcolumn = "0"
opt.foldtext = ""

opt.foldlevel = 99
opt.foldlevelstart = 1
opt.foldnestmax = 4
