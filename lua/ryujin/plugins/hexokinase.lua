return {
  "RRethy/vim-hexokinase",
  build = 'make hexokinase',
  config = function()
    local g = vim.g
    g.Hexokinase_refreshEvents = "TextChanged, InsertLeave"
  end
}
