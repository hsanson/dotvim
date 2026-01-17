return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "AgenticChat" },
  config = function()
    require("render-markdown").setup({
      file_types = {
        "markdown", "AgenticChat"
      },
      heading = {
        icons = { "󰬺 ", "󰬻 ", "󰬼 ", "󰬽 ", "󰬾 ", "󰬿 " },
        position = 'inline',       -- Place icon inline instead of overlay
        width = 'block',          -- Background only for the heading text, not full width
        min_width = 80,           -- Minimum width for consistency
        left_margin = 0,          -- Remove any indentation
        left_pad = 1,             -- Small padding around the icon
        right_pad = 1,            -- Small padding around the icon
      },
      code = {
        position = "left",
        width = "block",
        left_pad = 1,
        right_pad = 1,
        border = "thick",
      },
    })

    local headingbg = "#2c50a3"
    local bg_alt = "#1e2124"
    local orange = "#d17c00"
    local purple = "#a018ff"

    vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#FFFFFF", bg = headingbg, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#FFFFFF", bg = headingbg, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#FFFFFF", bg = headingbg, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#FFFFFF", bg = headingbg, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = "#FFFFFF", bg = headingbg, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = "#FFFFFF", bg = headingbg, blend = 10 })
    vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownCode", { fg = orange, bg = bg_alt, blend = 50 })
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeInfo", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { bg = bg_alt, blend = 50 })
    vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = headingbg })
  end,
}
