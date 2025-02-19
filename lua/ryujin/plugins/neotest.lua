return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rcasia/neotest-java",
    "codymikol/neotest-kotlin",
    "olimorris/neotest-rspec",
    "nvim-neotest/neotest-go",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-java"),
        require("neotest-kotest"),
        require("neotest-rspec"),
        require("neotest-go")({
          args = { "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out" },
        })
      }
    })

    local opts = { noremap = true, silent = true, desc = "Run test" }
    vim.keymap.set('n', '<Leader>rt', ':lua require("neotest").run.run()<CR>', opts)
    opts.desc = "Run all tests"
    vim.keymap.set('n', '<Leader>rT', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
  end
}
