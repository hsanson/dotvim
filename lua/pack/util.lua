-- Helper for loading dev plugins (local git worktrees) directly into rtp.
-- Unlike vim.pack.add(), this preserves live editing of the source tree.
local M = {}

function M.load_dev(path, post)
  path = vim.fn.expand(path)
  if vim.fn.isdirectory(path) == 0 then
    vim.notify("dev plugin path not found: " .. path, vim.log.levels.WARN)
    return
  end
  vim.opt.rtp:prepend(path)
  for _, f in ipairs(vim.fn.glob(path .. "/plugin/*.vim", false, true)) do
    vim.cmd("source " .. vim.fn.fnameescape(f))
  end
  for _, f in ipairs(vim.fn.glob(path .. "/plugin/*.lua", false, true)) do
    dofile(f)
  end
  if post then post() end
end

return M
