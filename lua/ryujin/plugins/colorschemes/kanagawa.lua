return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = true,
      commentStyle = { italic = true },
      transparent = true,
      dimInactive = false,
      -- Themes wave, lotus, or dragon
      theme = 'dragon'
    })
  end
}
