return {
  "NickvanDyke/opencode.nvim",
  enabled = false,
  dependencies = {
    -- Required for better prompt input and embedded terminal
    { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  },
  config = function()
    vim.g.opencode_opts = {
      input = {
        win = {
          position = "float",
          border = "rounded",
          title_pos = "center",
          height = math.floor(vim.o.lines * 0.5),
          width = math.floor(vim.o.columns * 0.7),
          relative = "editor",
          row = math.floor((vim.o.lines - vim.o.lines * 0.5) / 2),
          col = math.floor((vim.o.columns - vim.o.columns * 0.7) / 2),
        },
      },
      terminal = {
        start_insert = false,
        auto_insert = false,
        auto_close = true,
        win = {
          position = "right",
          enter = false,
        },
      },
    }

    -- Required for opts.auto_reload
    vim.opt.autoread = true

    -- Keymaps following the existing <leader>a* pattern
    vim.keymap.set("n", "<leader>aA", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })

    vim.keymap.set("n", "<leader>aa", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").ask()
    end, { desc = "Ask opencode" })

    vim.keymap.set("n", "<leader>ac", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").ask("@cursor: ")
    end, { desc = "Ask opencode about cursor" })

    vim.keymap.set("v", "<leader>aa", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").ask("@selection: ")
    end, { desc = "Ask opencode about selection" })

    vim.keymap.set("n", "<leader>an", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").command("session_new")
    end, { desc = "New opencode session" })

    vim.keymap.set("n", "<leader>at", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").command("agent_cycle")
    end, { desc = "Change agent" })

    vim.keymap.set("n", "<leader>ay", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").command("messages_copy")
    end, { desc = "Copy last opencode response" })

    vim.keymap.set({ "n", "v" }, "<leader>as", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").select()
    end, { desc = "Select opencode prompt" })

    -- Custom prompt: explain code
    vim.keymap.set("n", "<leader>ae", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").prompt("Explain @cursor and its context")
    end, { desc = "Explain this code" })
  end,
}
