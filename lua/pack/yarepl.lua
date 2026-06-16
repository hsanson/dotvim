-- usql.nvim (dev plugin) must be loaded before yarepl config runs
-- because yarepl requires('usql.yarepl') during setup.
vim.pack.add({ 'https://github.com/milanglacier/yarepl.nvim' }, { load = true })

local yarepl = require('yarepl')
local usql = require('usql.yarepl')

yarepl.setup({
  buflisted = false,
  scratch = false,
  ft = 'REPL',
  wincmd = 'belowright 20 split',
  metas = {
    aichat = { cmd = 'aichat', formatter = yarepl.formatter.bracketed_pasting },
    radian = { cmd = 'radian', formatter = yarepl.formatter.bracketed_pasting },
    python = { cmd = 'ipython', formatter = yarepl.formatter.bracketed_pasting },
    R = { cmd = 'R', formatter = yarepl.formatter.trim_empty_lines },
    bash = { cmd = 'bash', formatter = yarepl.formatter.trim_empty_lines },
    zsh = { cmd = 'zsh', formatter = yarepl.formatter.bracketed_pasting },
    ruby = { cmd = 'pry', formatter = yarepl.formatter.trim_empty_lines },
    usql = { cmd = usql.cmd, formatter = usql.formatter },
  },
  close_on_exit = true,
  scroll_to_bottom_after_sending = true,
  os = {
    windows = {
      send_delayed_final_cr = true,
    },
  },
})
