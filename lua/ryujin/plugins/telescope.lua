return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    'jvgrootveld/telescope-zoxide',
    'BurntSushi/ripgrep',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require("telescope.actions")
    local z_utils = require("telescope._extensions.zoxide.utils")

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      },
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- False will only do exact matching
          override_generic_sorter = true,  -- Override the generic sorter
          override_file_sorter = true,     -- Override the file sorter
          case_mode = "smart_case",        -- Or "ignore_case" or "respect_case"
                                           -- The default case_mode is "smart_case"
        },
        zoxide = {
          prompt_title = "[ Walking on the shoulders of TJ ]",
          mappings = {
            default = {
              after_action = function(selection)
                print("Update to (" .. selection.z_score .. ") " .. selection.path)
              end
            },
            ["<C-s>"] = {
              before_action = function(_) print("before C-s") end,
              action = function(selection)
                vim.cmd.edit(selection.path)
              end
            },
            ["<C-q>"] = { action = z_utils.create_basic_command("split") },
          },
        }
      }
    }

    telescope.load_extension('fzf')
    telescope.load_extension('zoxide')

    -- Telescope
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>ft', function()
      builtin.grep_string({search_dirs={"/home/ryujin/Seafile/Notes/Allm"}, search="\\[\\s*\\]", use_regex=true})
    end, {})
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files({search_dirs={"~/Seafile/Notes"}})
    end, {})
    vim.keymap.set("n", "<leader>cd", telescope.extensions.zoxide.list, {})
  end
}
