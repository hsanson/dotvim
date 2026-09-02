vim.pack.add({ 'https://github.com/EskelinenAntti/omarchy-theme.nvim' }, { load = true })
local transparency_file = vim.fn.stdpath('config') .. '/plugin/after/transparency.lua'

local M = {}

function M.apply()
  if not require('omarchy-theme.environment').is_omarchy() then
    return
  end

  -- The plugin reloads by calling apply() directly, without a ColorScheme event.
  local theme = require('omarchy-theme')
  local apply_theme = theme.apply
  theme.apply = function()
    apply_theme()
    vim.cmd.source(transparency_file)
  end

  vim.cmd.colorscheme('omarchy')
end

return M
