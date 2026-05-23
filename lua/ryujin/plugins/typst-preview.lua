return {
  "chomosuke/typst-preview.nvim",
  lazy = false, -- or ft = 'typst'
  version = "1.*",
  ft = "typst",
  config = function()
    require("typst-preview").setup({
      dependencies_bin = {
        ["tinymist"] = "tinymist",
        ["websocat"] = "websocat", -- Use system-installed websocat
      },
    })
  end,
}
