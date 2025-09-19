return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
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

    -- Telescope
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
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>ft", function()
      builtin.grep_string({ search_dirs = { "~/Seafile/Notes/Allm" }, search = "\\[\\s*\\]", use_regex = true })
    end, {})
    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files({ search_dirs = { "~/Seafile/Notes" } })
    end, {})
  end,
}
