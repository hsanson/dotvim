return {
  "chomosuke/typst-preview.nvim",
  lazy = false, -- or ft = 'typst'
  version = "1.*",
  ft = "typst",
  config = function()
    require("typst-preview").setup({
      -- Use mason-installed tinymist
      dependencies_bin = {
        ["tinymist"] = vim.fn.stdpath("data") .. "/mason/bin/tinymist",
        ["websocat"] = "websocat", -- Use system-installed websocat
      },
    })

    vim.keymap.set("n", "<leader>rr", "<cmd>TypstPreview<cr>", {
      noremap = true,
      silent = true,
      desc = "Preview typst document",
    })
  end,
}
