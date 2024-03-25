local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
local lualine = require("lualine")

local group = augroup('SqlsGroup', { clear = true })

vim.keymap.set('n', '<localleader>re', '<cmd>SqlsSwitchConnection<cr>', {
  desc = "Sqls switch connection",
  remap = false,
  buffer = 0
})

vim.keymap.set('n', '<localleader>rr', '<cmd>SqlsExecuteQuery<cr>', {
  desc = "Sqls execute query",
  remap = false,
  buffer = 0
})

autocmd('User', {
  group = group,
  pattern = 'SqlsConnectionChoice',
  callback = function(event)
    local choice = vim.split(event.data.choice, ' ')
    vim.notify(vim.inspect(choice))
    vim.b[event.buf].sqls_name = choice[3]
    vim.b[event.buf].sqls_driver = choice[2]
    lualine.refresh()
  end
})

autocmd('User', {
  group = group,
  pattern = 'SqlsDatabaseChoice',
  callback = function(event)
    local choice = vim.split(event.data.choice, ' ')
    vim.notify(vim.inspect(choice))
    vim.b[event.buf].sqls_db = choice[1]
    lualine.refresh()
  end
})
