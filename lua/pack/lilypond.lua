vim.pack.add({ 'https://github.com/martineausimon/nvim-lilypond-suite' }, { load = true })

require('nvls').setup({
  lilypond = {
    mappings = {
      player = '<localleader>re',
      compile = '<localleader>rr',
      open_pdf = '<localleader>rt',
    },
    options = {
      pdf_viewer = 'zathura',
    },
  },
  latex = {
    options = {
      pdf_viewer = 'zathura',
    },
  },
})
