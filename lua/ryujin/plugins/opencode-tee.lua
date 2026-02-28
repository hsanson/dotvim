return {
  "sudo-tee/opencode.nvim",
  name = "opencode-tee",
  config = function()
    require("opencode").setup({
      preferred_picker = 'snacks',
      preferred_completion = 'nvim-cmp',
      default_global_keymaps = false,
      default_mode = 'build',
      keymap_prefix = '<leader>a',
      opencode_executable = 'opencode',
      keymap = {
        editor = {
          ['<leader>ao'] = { 'toggle' },
          ['<leader>aa'] = { 'open_input' },
          ['<leader>an'] = { 'open_input_new_session' },
          ['<leader>as'] = { 'select_session' },
          ['<leader>ar'] = { 'rename_session' },
          ['<leader>at'] = { 'timeline' },
          ['<leader>ap'] = { 'configure_provider' },
          ['<S-Tab>'] = { 'switch_mode' },                               -- Switch between modes (build/plan)
        },
        input_window = {
          ['<C-s>'] = { 'submit_input_prompt', mode = { 'n', 'i' } }, -- Submit prompt (normal mode and insert mode)
          ['<esc>'] = { 'close' },                                     -- Close UI windows
          ['<C-c>'] = { 'cancel' },                                    -- Cancel opencode request while it is running
          ['~'] = { 'mention_file', mode = 'i' },                      -- Pick a file and add to context. See File Mentions section
          ['@'] = { 'mention', mode = 'i' },                           -- Insert mention (file/agent)
          ['/'] = { 'slash_commands', mode = 'i' },                    -- Pick a command to run in the input window
          ['#'] = { 'context_items', mode = 'i' },                     -- Manage context items (current file, selection, diagnostics, mentioned files)
          ['<M-v>'] = { 'paste_image', mode = 'i' },                   -- Paste image from clipboard as attachment
          ['<C-i>'] = { 'focus_input', mode = { 'n', 'i' } },          -- Focus on input window and enter insert mode at the end of the input from the output window
          ['<tab>'] = { 'toggle_pane', mode = { 'n', 'i' } },          -- Toggle between input and output panes
          ['<up>'] = { 'prev_prompt_history', mode = { 'n', 'i' } },   -- Navigate to previous prompt in history
          ['<down>'] = { 'next_prompt_history', mode = { 'n', 'i' } }, -- Navigate to next prompt in history
          ['<M-m>'] = { 'switch_mode' },                               -- Switch between modes (build/plan)
          ['<S-Tab>'] = { 'switch_mode' },                               -- Switch between modes (build/plan)
        },
        output_window = {
          ['<esc>'] = { 'close' },                            -- Close UI windows
          ['<C-c>'] = { 'cancel' },                           -- Cancel opencode request while it is running
          [']]'] = { 'next_message' },                        -- Navigate to next message in the conversation
          ['[['] = { 'prev_message' },                        -- Navigate to previous message in the conversation
          ['<tab>'] = { 'toggle_pane', mode = { 'n', 'i' } }, -- Toggle between input and output panes
          ['i'] = { 'focus_input', 'n' },                     -- Focus on input window and enter insert mode at the end of the input from the output window
          ['<M-r>'] = { 'cycle_variant', mode = { 'n' } },    -- Cycle through available model variants
          ['<leader>oS'] = { 'select_child_session' },        -- Select and load a child session
          ['<leader>oD'] = { 'debug_message' },               -- Open raw message in new buffer for debugging
          ['<leader>oO'] = { 'debug_output' },                -- Open raw output in new buffer for debugging
          ['<leader>ods'] = { 'debug_session' },              -- Open raw session in new buffer for debugging
          ['<S-Tab>'] = { 'switch_mode' },                               -- Switch between modes (build/plan)
        },
      }
    })
  end,
}
