-------------------------------------------------------------------------------
-- Cool json formatting command.
-- Requires jq installed and works with non Ascii characters like Japanese.
vim.cmd([[command! -range=% JSONFormat <line1>,<line2>!jq .]])

-------------------------------------------------------------------------------
-- Cool json formatting command.
-- Requires jq installed and works with non Ascii characters like Japanese.
vim.cmd([[command! -range=% XMLFormat <line1>,<line2>!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"]])

-------------------------------------------------------------------------------
-- Generate random messages
vim.api.nvim_create_user_command('GenPass', function(opts)
    local len = tonumber(opts.args) or 32
    -- Request extra bytes to ensure enough characters after Base64/tr
    local byte_len = math.ceil(len * 0.75) + 5
    local cmd = string.format("openssl rand -base64 %d | tr -d '\\n' | tr '+/' '-_' | cut -c1-%d", byte_len, len)

    local password = vim.fn.system(cmd):gsub("%s+", "")
    vim.api.nvim_put({password}, 'c', true, true)
end, { nargs = '?' })

-------------------------------------------------------------------------------
-- Updade packages
vim.api.nvim_create_user_command('Packupdate', function(opts)
  local len = #opts.fargs
  if len > 0 then
    vim.pack.update(opts.fargs)
  else
    vim.pack.update()
  end
end, { nargs = '*' })

vim.api.nvim_create_user_command('Packclean', function(opts)
  local len = #opts.fargs
  if len > 0 then
    vim.pack.del(opts.fargs)
  else
    local inactive = {}
    for _, p in ipairs(vim.pack.get()) do
      if not p.active then
        table.insert(inactive, p.spec.name)
      end
    end
    if #inactive > 0 then
      vim.pack.del(inactive)
    else
      vim.notify("No inactive packages to clean.", vim.log.levels.INFO)
    end
  end
end, { nargs = '*' })
