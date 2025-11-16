return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  config = function()
    require("render-markdown").setup({
      file_types = {
        "markdown",
      },
      heading = {
        icons = { "󰬺 ", "󰬻 ", "󰬼 ", "󰬽 ", "󰬾 ", "󰬿 " },
      },
      code = {
        position = "left",
        width = "block",
        left_pad = 1,
        right_pad = 1,
        border = "thick",
      },
    })

    local bg_alt = "#1e2124"
    local orange = "#d17c00"
    local purple = "#a018ff"

    vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#FFFFFF", bg = orange, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#FFFFFF", bg = orange, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#FFFFFF", bg = orange, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#FFFFFF", bg = orange, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = "#FFFFFF", bg = orange, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = "#FFFFFF", bg = orange, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownCode", { fg = orange, bg = bg_alt, blend = 50 })
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeInfo", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { bg = bg_alt, blend = 50 })
    vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = orange })
  end,
}
