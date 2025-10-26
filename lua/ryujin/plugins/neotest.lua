return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "rcasia/neotest-java",
    "codymikol/neotest-kotlin",
    "olimorris/neotest-rspec",
    {
      "fredrikaverpil/neotest-golang",
      enabled = true,
      version = "*",
      build = function()
        vim.system(
          { "go", "install", "gotest.tools/gotestsum@latest" },
          { wait = true }
        )
      end,
    }
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec"),
        require("neotest-golang")({
          runner = "gotestsum",
          go_test_args = {
            "-v",
            "-race",
            "-count=1",
            "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
          },
        }),
      },
    })
  end,
}
