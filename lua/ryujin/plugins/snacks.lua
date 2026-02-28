return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    picker = {
      enabled = true,
      actions = {
        opencode_send = function(picker)
          local selected = picker:selected({ fallback = true })
          if selected and #selected > 0 then
            local files = {}
            for _, item in ipairs(selected) do
              local path = Snacks.picker.util.path(item)
              if path then
                table.insert(files, path)
              end
            end
            picker:close()

            if #files > 0 then
              require("opencode.core").open({
                new_session = false,
                focus = "input",
                start_insert = true,
              })

              local context = require("opencode.context")
              for _, file in ipairs(files) do
                context.add_file(file)
              end
            end
          end
        end,
      },
      win = {
        input = {
          keys = {
            ["<C-o>"] = { "opencode_send", mode = { "n", "i" } },
          },
        },
      },
    },
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = { enabled = true },
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
  config = function(_, opts)
    require("snacks").setup(opts)
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
    { "<leader>ff", function()
      require("snacks").picker("files", { hidden = true })
    end, desc = "File picker" },

    { "<leader>fc", function()
      require("snacks").picker("colorschemes")
    end, desc = "Colorscheme picker" },

    { "<leader>fb", function()
      require("snacks").picker("buffers")
    end, desc = "Buffers picker" },

    { "<leader>ft", function()
      require("snacks").picker("grep", {
        dirs = { "~/Seafile/Notes/Allm" },
        search = "\\[\\s*\\]",
        regex = true,
        live = false
      })
    end, desc = "Todo picker" },

    { "<leader>fn", function()
      require("snacks").picker("files", {
        dirs = { "~/Seafile/Notes" },
        ft = { "adoc" }
      })
    end, desc = "Notes picker" },

    { "<leader>fg", function()
      require("snacks").picker("grep", {
        args = { 
          "--hidden", "--glob", "!**/node_modules/*",
          "--glob", "!**/.git/*", "--glob", "!**/.gradle/*"
        },
        live = true
      })
    end, desc = "Live grep" },

    { "<leader>fh", function()
      _G.find_or_create_tab("kulala")
      local http_path = vim.fn.expand("~/.config/rest")
      vim.cmd("lcd " .. http_path)
      require("snacks").picker("files", {
        dirs = { http_path },
        ft = { "http" }
      })
    end, desc = "Open Kulala tab" },

    { "<leader>fs", function()
      _G.find_or_create_tab("usql")
      local queries_path = vim.fn.expand("~/.config/sqls/queries")
      vim.cmd("lcd " .. queries_path)
      require("snacks").picker("files", {
        dirs = { queries_path },
        ft = { "sql" }
      })
    end, desc = "Open USQL tab" }
  }
}
