return {
  "fredrikaverpil/neotest-golang",
  enabled = true,
  version = "*",
  build = function()
    vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait()
  end,
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
