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
        require("neotest-go")
      }
    })
  end
}
