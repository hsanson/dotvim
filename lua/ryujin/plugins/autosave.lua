return {
  'nullishamy/autosave.nvim',
  lazy = true,
  config = function()
    -- Must call setup to initialize some buffer state variables.
    require("autosave").setup({})
  end
}
