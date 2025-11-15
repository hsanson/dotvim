return {
  'martineausimon/nvim-lilypond-suite',
  opts = {
    lilypond = {
      mappings = {
        player = "<localleader>re",
        compile = "<localleader>rr",
        open_pdf = "<localleader>rt"
      },
      options = {
        pdf_viewer = "zathura",
      },
    },
    latex = {
      options = {
        pdf_viewer = "zathura",
      },
    },
  }
}
