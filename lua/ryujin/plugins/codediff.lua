return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  config = function()
    require("codediff").setup({
      -- Explorer panel configuration
      explorer = {
        position = "bottom",  -- "left" or "bottom"
        width = 40,         -- Width when position is "left" (columns)
        height = 10,        -- Height when position is "bottom" (lines)
        indent_markers = true,  -- Show indent markers in tree view (│, ├, └)
        icons = {
          folder_closed = "",  -- Nerd Font folder icon (customize as needed)
          folder_open = "",    -- Nerd Font folder-open icon
        },
        view_mode = "list",    -- "list" or "tree"
        file_filter = {
          ignore = {},  -- Glob patterns to hide (e.g., {"*.lock", "dist/*"})
        },
      },

      -- Keymaps in diff view
      keymaps = {
        view = {
          quit = "q",                    -- Close diff tab
          toggle_explorer = "<leader>b",  -- Toggle explorer visibility (explorer mode only)
          next_hunk = "]c",   -- Jump to next change
          prev_hunk = "[c",   -- Jump to previous change
          next_file = "]f",   -- Next file in explorer mode
          prev_file = "[f",   -- Previous file in explorer mode
          diff_get = "do",    -- Get change from other buffer (like vimdiff)
          diff_put = "dp",    -- Put change to other buffer (like vimdiff)
        },
        explorer = {
          select = "<CR>",    -- Open diff for selected file
          hover = "K",        -- Show file diff preview
          refresh = "R",      -- Refresh git status
          toggle_view_mode = "i",  -- Toggle between 'list' and 'tree' views
        },
        conflict = {
          accept_incoming = "<leader>ct",  -- Accept incoming (theirs/left) change
          accept_current = "<leader>co",   -- Accept current (ours/right) change
          accept_both = "<leader>cb",      -- Accept both changes (incoming first)
          discard = "<leader>cx",          -- Discard both, keep base
          next_conflict = "]x",            -- Jump to next conflict
          prev_conflict = "[x",            -- Jump to previous conflict
          diffget_incoming = "2do",        -- Get hunk from incoming (left/theirs) buffer
          diffget_current = "3do",         -- Get hunk from current (right/ours) buffer
        },
      },
    })
  end
}
