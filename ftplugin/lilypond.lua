vim.api.nvim_create_autocmd('BufEnter', {
  command = "syntax sync fromstart",
  pattern = { '*.ly', '*.ily', '*.tex' }
})
