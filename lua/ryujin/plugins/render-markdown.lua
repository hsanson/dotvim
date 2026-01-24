return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "AgenticChat" },
  enabled = false,
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
  end,
}
