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

    local coverage_group = vim.api.nvim_create_augroup(
      "CoverageAutoLoad",
      { clear = true }
    )

    vim.api.nvim_create_autocmd("FileType", {
      group = coverage_group,
      pattern = "go",
      callback = function()
        local coverage_file = vim.fn.getcwd() .. "/coverage.out"
        if vim.fn.filereadable(coverage_file) ~= 0 then
          vim.cmd("CoverageLoad")
        end
      end,
    })

    local opts = {
      noremap = true,
      silent = true,
      desc = "Show coverage summary"
    }
    vim.keymap.set('n',
      '<Leader>rc',
      '<cmd>Coverage<CR><cmd>CoverageSummary<CR>',
      opts)
	end,
}
