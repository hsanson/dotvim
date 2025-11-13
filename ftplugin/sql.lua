local function open_repl()
  local yarepl = require("yarepl")

  local current_buffer = vim.api.nvim_get_current_buf()
  local repl = yarepl._get_repl(0, nil, current_buffer)

  if not repl then
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd("REPLStart usql")
    vim.api.nvim_set_current_win(current_win)
  end
end

local function run_cmd_with_count(cmd)
  return function()
    vim.cmd(string.format("%d%s", vim.v.count, cmd))
  end
end

vim.keymap.set("n", "<localleader>rt", function()
  open_repl()
end, {desc = "Open SQL REPL"})

vim.keymap.set("n", "<localleader>re", function()
  open_repl()
  require("usql").select_connection()
end, {desc = "Switch DB connection"})

vim.keymap.set("n", "<localleader>rr", function()
  open_repl()
  require("usql.yarepl").send_statement()
end, { desc = "Send SQL Statement" })

vim.keymap.set("n", "<localleader>rf", function()
  open_repl()
  require("usql.yarepl").send_file()
end, { desc = "Send SQL file" })

vim.keymap.set("v", "<localleader>rr", "", {
  callback = run_cmd_with_count("REPLSendVisual"),
  desc = "Send visual region",
})

vim.keymap.set("n", "<localleader>rc", "REPLCleanup<CR>", {
  desc = "Clear REPLs.",
})
