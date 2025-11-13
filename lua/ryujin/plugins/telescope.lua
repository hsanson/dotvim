return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-treesitter/nvim-treesitter",
    "BurntSushi/ripgrep",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<A-k>"] = actions.move_selection_previous,
            ["<A-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<A-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<Tab>"] = function(prompt_bufnr)
              actions.toggle_selection(prompt_bufnr)
              actions.move_selection_next(prompt_bufnr)
            end,
          },
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- False will only do exact matching
          override_generic_sorter = true, -- Override the generic sorter
          override_file_sorter = true, -- Override the file sorter
          case_mode = "smart_case", -- Or "ignore_case" or "respect_case"
          -- The default case_mode is "smart_case"
        },
      },
    })

    telescope.load_extension("fzf")

    -- Keymaps
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {})

    vim.keymap.set("n", "<leader>ff", function()
      builtin.find_files({
        file_ignore_patterns = { "^node_modules/", "^.git/", "^.venv/", "^.gradle/", "^vendor/" },
        hidden = true,
      })
    end, {})

    vim.keymap.set("n", "<leader>fg", function()
      builtin.live_grep({
        additional_args = function(opts)
          return { "--hidden", "--glob", "!**/node_modules/*", "--glob", "!**/.git/*", "--glob", "!**/.gradle/*" }
        end,
      })
    end, {})

    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

    vim.keymap.set("n", "<leader>ft", function()
      builtin.grep_string({ search_dirs = { "~/Seafile/Notes/Allm" }, search = "\\[\\s*\\]", use_regex = true })
    end, {})

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

    vim.keymap.set("n", "<leader>fn", function()
      find_or_create_tab("notes")
      local notes_path = vim.fn.expand("~/Seafile/Notes")
      vim.cmd("lcd " .. notes_path)
      builtin.find_files({
        search_dirs = { notes_path },
        path_display = { "Notes" },
        cwd = http_path,
        find_command = { "rg", "--files", "--glob", "*.adoc" }
      })
    end, {})

    vim.keymap.set("n", "<leader>fs", function()
    end, {})

    vim.keymap.set("n", "<leader>fs", function()
      find_or_create_tab("usql")
      local queries_path = vim.fn.expand("~/.config/sqls/queries")
      vim.cmd("lcd " .. queries_path)
      builtin.find_files({
        search_dirs = { queries_path },
        path_display = { "smart" },
        cwd = queries_path,
        find_command = { "rg", "--files", "--glob", "*.sql" }
      })
    end, { desc = "Open USQL tab" })

    vim.keymap.set("n", "<leader>fh", function()
      find_or_create_tab("kulala")
      local http_path = vim.fn.expand("~/.config/rest")
      vim.cmd("lcd " .. http_path)
      builtin.find_files({
        search_dirs = { http_path },
        path_display = { "smart" },
        cwd = http_path,
        find_command = { "rg", "--files", "--glob", "*.http" }
      })
    end, { desc = "Open Kulala tab" })
  end,
}
