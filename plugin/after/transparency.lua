-- Make highlight groups transparent while preserving their other attributes.
local function make_transparent(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok then
    hl.bg = nil
    vim.api.nvim_set_hl(0, name, hl)
  end
end

local groups = {
  -- Editor backgrounds
  'Normal',
  'NormalFloat',
  'FloatBorder',
  'Pmenu',
  'Terminal',
  'EndOfBuffer',
  'FoldColumn',
  'Folded',
  'SignColumn',
  'LineNr',
  'CursorLineNr',
  'NormalNC',
  'WhichKeyFloat',
  'TelescopeBorder',
  'TelescopeNormal',
  'TelescopePromptBorder',
  'TelescopePromptTitle',

  -- Neo-tree
  'NeoTreeNormal',
  'NeoTreeNormalNC',
  'NeoTreeVertSplit',
  'NeoTreeWinSeparator',
  'NeoTreeEndOfBuffer',

  -- nvim-tree
  'NvimTreeNormal',
  'NvimTreeVertSplit',
  'NvimTreeEndOfBuffer',

  -- Notifications
  'NotifyINFOBody',
  'NotifyERRORBody',
  'NotifyWARNBody',
  'NotifyTRACEBody',
  'NotifyDEBUGBody',
  'NotifyINFOTitle',
  'NotifyERRORTitle',
  'NotifyWARNTitle',
  'NotifyTRACETitle',
  'NotifyDEBUGTitle',
  'NotifyINFOBorder',
  'NotifyERRORBorder',
  'NotifyWARNBorder',
  'NotifyTRACEBorder',
  'NotifyDEBUGBorder',
}

for _, name in ipairs(groups) do
  make_transparent(name)
end
