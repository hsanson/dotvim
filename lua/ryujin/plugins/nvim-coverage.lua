return {
	'andythigpen/nvim-coverage',
	config = function()
    require('coverage').setup({
      auto_reload = true,
      signs = {
        covered = { hl = "CoverageCovered", text = "" },
        uncovered = { hl = "CoverageUncovered", text = "▎" },
        partial = { hl = "CoveragePartial", text = "▎" },
      },
      lang = {
        go = {
          coverage_file = vim.fn.getcwd() .. "/coverage.out",
        }
      }
    })
    local opts = { noremap = true, silent = true, desc = "Show coverage" }
    vim.keymap.set('n', '<Leader>rc', '<cmd>CoverageLoad<CR><cmd>Coverage<CR>', opts)
    opts.desc = "Show coverage summary"
    vim.keymap.set('n', '<Leader>rC', '<cmd>CoverageLoad<CR><cmd>CoverageSummary<CR>', opts)
	end,
}
