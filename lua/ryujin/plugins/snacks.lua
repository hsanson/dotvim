return {
  "folke/snacks.nvim",
  opts = {
    picker = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn= { enabled = true },
    terminal = {
      enabled = true,
      win = {
        position = "float",
        relative = "editor",
        row = -1,
        width = 0.4,
        border = "rounded",
      }
    }
  },
  config = function()
    -- Helper function to find or create a named tab
    local function find_or_create_tab(tab_name)
      local tabpages = vim.api.nvim_list_tabpages()
      local target_tab = nil

      -- Check if tab with this variable already exists
      for _, tab in ipairs(tabpages) do
        local success, tab_var = pcall(vim.api.nvim_tabpage_get_var, tab, "tab_name")
        if success and tab_var == tab_name then
          target_tab = tab
          break
        end
      end

      -- Switch to existing tab or create new one
      if target_tab then
        vim.api.nvim_set_current_tabpage(target_tab)
      else
        vim.cmd('tabnew')
        local current_tab = vim.api.nvim_get_current_tabpage()
        vim.api.nvim_tabpage_set_var(current_tab, "tab_name", tab_name)
      end
    end

    -- Store helper function for use in keymaps
    _G.find_or_create_tab = find_or_create_tab
  end,
  keys = {
    { "<leader>ff", function() Snacks.picker("files", { hidden = true }) end, desc = "File picker" },
    { "<leader>fc", function() Snacks.picker("colorschemes") end, desc = "Colorscheme picker" },
    { "<leader>fb", function() Snacks.picker("buffers") end, desc = "Buffers picker" },
    { "<leader>ft", function()
      Snacks.picker("grep", {
        dirs = { "~/Seafile/Notes/Allm" },
        search = "\\[\\s*\\]",
        regex = true,
        live = false
      })
    end, desc = "Todo picker" },
    { "<leader>fn", function()
      Snacks.picker("files", {
        dirs = { "~/Seafile/Notes" },
        ft = { "adoc" }
      })
    end, desc = "Notes picker" },
    { "<leader>fg", function()
      Snacks.picker("live_grep", {
        args = { "--hidden", "--glob", "!**/node_modules/*", "--glob", "!**/.git/*", "--glob", "!**/.gradle/*" }
      })
    end, desc = "Live grep" },
    { "<leader>fh", function()
      _G.find_or_create_tab("kulala")
      local http_path = vim.fn.expand("~/.config/rest")
      vim.cmd("lcd " .. http_path)
      Snacks.picker("files", {
        dirs = { http_path },
        ft = { "http" }
      })
    end, desc = "Open Kulala tab" },
    { "<leader>fs", function()
      _G.find_or_create_tab("usql")
      local queries_path = vim.fn.expand("~/.config/sqls/queries")
      vim.cmd("lcd " .. queries_path)
      Snacks.picker("files", {
        dirs = { queries_path },
        ft = { "sql" }
      })
    end, desc = "Open USQL tab" }
  }
}
