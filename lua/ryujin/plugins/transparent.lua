return {
  "xiyaowong/transparent.nvim",
  config = function()
    local g = vim.g
    local extras = { "CursorLine", "WinBar", "WinBarNC", "VertSplit", "WinSeparator" }
    g.transparent_groups = vim.list_extend(g.transparent_groups or {}, extras)
  end
}
