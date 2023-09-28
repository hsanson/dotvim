return {
  "lervag/vimtex",
  config = function()
    local g = vim.g

    g.vimtex_compiler_method = 'latexmk'
    g.vimtex_view_method = 'zathura'
    g.vimtex_quickfix_mode=0
    g.tex_conceal='abdmg'
    g.tex_flavor='latex'
    g.vimtex_compiler_progname = 'nvr'
    g.vimtex_fold_enabled = 0
    g.vimtex_complete_enabled = 0
    g.vimtex_matchparen_enabled = 0
    g.vimtex_syntax_enabled = 0

    g.vimtex_compiler_latexmk = {
      backend = 'nvim',
      background = 1,
      aux_dir = '/tmp/latexmk',
      out_dir = '/tmp/latexmk',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      }
    }
  end
}
