local terminals = {}

-- Creates a new floating terminal per working directory or opens one if already
-- created for that path.
local toggle_terminal = function()
  local fterm = require("FTerm")

  local tabnr = vim.fn.tabpagenr()
  local win_list = vim.api.nvim_tabpage_list_wins(tabnr)

  -- Check if there are any windows in the tab
  if #win_list <= 0 then
    return
  end

  -- Get the first window ID from the list
  local window_nr = win_list[1]

  local workdir = vim.fn.getcwd(window_nr)

  if terminals[workdir] == nil then
    vim.notify("Creating new terminal for " .. workdir)
    local new_terminal = fterm:new({
      border = "double",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })

    terminals[workdir] = new_terminal
  end

  vim.cmd("lcd " .. workdir)
  terminals[workdir]:toggle()
end

return {
  "numToStr/FTerm.nvim",
  keys = {
    {
      "<leader>tr",
      mode = { "n" },
      function()
        toggle_terminal()
      end,
      desc = "FTerm Toogle",
    },
  },
  config = function()
    -- Auto command to automatically close floating terminal
    -- when leaving terminal mode.
    vim.api.nvim_create_augroup("FTermClose", { clear = true })

    vim.api.nvim_create_autocmd("TermLeave", {
      group = "FTermClose",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        for _, terminal in pairs(terminals) do
          if terminal.buf == bufnr then
            terminal:close()
          end
        end
      end,
    })
  end,
}
