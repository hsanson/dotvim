return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Required for better prompt input and embedded terminal
    { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  },
  config = function()
    vim.g.opencode_opts = {
      terminal = {
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
    vim.keymap.set("n", "<leader>aa", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })

    vim.keymap.set("n", "<leader>aA", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").ask()
    end, { desc = "Ask opencode" })

    vim.keymap.set("n", "<leader>ac", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").ask("@cursor: ")
    end, { desc = "Ask opencode about cursor" })

    vim.keymap.set("v", "<leader>as", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").ask("@selection: ")
    end, { desc = "Ask opencode about selection" })

    vim.keymap.set("n", "<leader>an", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").command("session_new")
    end, { desc = "New opencode session" })

    vim.keymap.set("n", "<leader>ay", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").command("messages_copy")
    end, { desc = "Copy last opencode response" })

    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").command("messages_half_page_up")
    end, { desc = "Messages half page up" })

    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode.config").opts.terminal.cwd = vim.fn.getcwd()
      require("opencode").command("messages_half_page_down")
    end, { desc = "Messages half page down" })

    vim.keymap.set({ "n", "v" }, "<leader>os", function()
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
