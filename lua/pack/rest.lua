vim.pack.add({
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/lunarmodules/lua-mimetypes',
  'https://github.com/manoelcampos/xml2lua',
}, { load = true })

-- These Lua libraries keep their modules at the repository root.
for _, plugin in ipairs(vim.pack.get()) do
  if plugin.spec.name == 'lua-mimetypes' or plugin.spec.name == 'xml2lua' then
    package.path = plugin.path .. '/?.lua;' .. plugin.path .. '/?/init.lua;' .. package.path
  end
end

vim.pack.add({ 'https://github.com/rest-nvim/rest.nvim' }, { load = true })
