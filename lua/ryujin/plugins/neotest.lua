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
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message =
            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup({
      adapters = {
        -- require("neotest-java"),
        -- require("neotest-kotest"),
        require("neotest-rspec"),
        require("neotest-go")({
          recursive_run = true,
          args = { "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out" },
        })
      }
    })

    local opts = { noremap = true, silent = true, desc = "Run test under cursor" }
    vim.keymap.set('n', '<Leader>rr', ':lua require("neotest").run.run()<CR>', opts)
    opts.desc = "Run all tests inside current file"
    vim.keymap.set('n', '<Leader>rf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
    opts.desc = "Debug current file"
    vim.keymap.set('n', '<Leader>rd', ':lua require("neotest").run.run({ strategy = "dap" })<CR>', opts)
    opts.desc = "Run all test suite"
    vim.keymap.set('n', '<Leader>rA', ':lua require("neotest").run.run(vim.fn.getcwd())<CR>', opts)
    opts.desc = "Show test results"
    vim.keymap.set('n', '<Leader>rh', ':lua require("neotest").output.open({ enter = true })<CRj', opts)
  end
}
