local terminals = {}

local get_tab_cwd = function()
  local tabnr = vim.fn.tabpagenr()
  local win_list = vim.api.nvim_tabpage_list_wins(tabnr)

  -- Check if there are any windows in the tab
  if #win_list <= 0 then
    return
  end

  -- Get the first window ID from the list
  local window_nr = win_list[1]

  return vim.fn.getcwd(window_nr)
end

local find_or_create_terminal = function(workdir, command)
  local fterm = require("FTerm")
  local key = workdir .. "/" .. command

  if terminals[key] == nil then
    vim.notify("Creating new terminal for " .. workdir)
    local new_terminal = fterm:new({
      cmd = command,
      border = "double",
      dimensions = {
        height = 0.95,
        width = 0.95,
      },
    })

    terminals[key] = new_terminal
  end

  return terminals[key]
end

-- Creates a new floating terminal per working directory or opens one if already
-- created for that path.
local toggle_terminal = function(command)
  local workdir = get_tab_cwd()
  local term = find_or_create_terminal(workdir, command)

  if term then
    vim.cmd("lcd " .. workdir)
    term:toggle()
  end
end

return {
  "numToStr/FTerm.nvim",
  keys = {
    {
      "<leader>tr",
      mode = { "n" },
      function()
        toggle_terminal(os.getenv("SHELL"))
      end,
      desc = "FTerm Open",
    },
    {
      "<leader>tr",
      mode = { "t" },
      function()
        toggle_terminal(os.getenv("SHELL"))
      end,
      desc = "FTerm Open",
    },
    {
      "<leader>aa",
      mode = { "n" },
      function()
        toggle_terminal("opencode")
      end,
      desc = "FTerm Open",
    },
    {
      "<leader>aa",
      mode = { "t" },
      function()
        toggle_terminal("opencode")
      end,
      desc = "FTerm Open",
    },
  },
}
