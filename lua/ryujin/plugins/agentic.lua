return {
  "carlos-algms/agentic.nvim",
  enabled = true,

  event = "VeryLazy",

  opts = {
    -- Available by default: "claude-acp" | "gemini-acp" | "codex-acp" | "opencode-acp"
    provider = "opencode-acp", -- setting the name here is all you need to get started
    acp_providiers = {
      ["opencode-acp"] = {
        command = "~/.local/bin/opencode",
      }
    },
    debug = true,
    keymaps = {
      -- Keybindings for ALL buffers in the widget (chat, prompt, code, files)
      widget = {
        close = "q",  -- String for a single keybinding
        change_mode = {
          {
            "<S-Tab>",
            mode = { "i", "n", "v" },  -- Specify modes for this keybinding
          },
        },
      },

      -- Keybindings for the prompt buffer onlyaa
      prompt = {
        submit = {
          "<CR>",  -- Normal mode, just Enter
          {
            "<C-s>",
            mode = { "n", "v", "i" },
          },
        },

        paste_image = {
          {
            "<C-p>",
            mode = { "n", "i" }, -- I like normal and insert modes for this, but feel free to customize
          },
        },
      },
    }
  },

  -- these are just suggested keymaps; customize as desired
  keys = {
    {
      "<C-\\>",
      function() require("agentic").toggle() end,
      mode = { "n", "v", "i" },
      desc = "Toggle Agentic Chat"
    },
    {
      "<leader>aa",
      function() require("agentic").add_selection_or_file_to_context() end,
      mode = { "n", "v" },
      desc = "Add file or selection to Agentic to Context"
    },
    {
      "<C-,>",
      function() require("agentic").new_session() end,
      mode = { "n", "v", "i" },
      desc = "New Agentic Session"
    },
  },
}
