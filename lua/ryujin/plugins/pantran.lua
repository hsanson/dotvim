return {
  -- Translation plugin that uses google translate.
  -- Usage:
  --   <leader>pr + motion   Translate text selected via motion.
  --   <leader>prr           Translate current line.
  --   <leader>pr + visual   Translate visually selected text.
  --
  -- UI:
  --   gt   Change target language.
  --   gs   Change source language
  --   gy   Yank translation.
  --   gr   Replace text with translation.
  --   ga   Append translation.
  --   ge   Change translation engine
  "potamides/pantran.nvim",
  keys = {
    { "<leader>pr" },
    { "<leader>prr" },
    { "<leader>pr", mode = "v" }
  },
  config = function()
    local pantran = require("pantran")
    local opts = {noremap = true, silent = true, expr = true}

    pantran.setup({
      default_engine = "google",
      engines = {
        argos = {
          default_source = "auto",
          default_target = "ja"
        },
        google = {
          default_source = "auto",
          default_target = "ja"
        }
      }
    })

    vim.keymap.set("n", "<leader>pr", pantran.motion_translate, opts)
    vim.keymap.set("n", "<leader>prr", function() return pantran.motion_translate() .. "_" end, opts)
    vim.keymap.set("x", "<leader>pr", pantran.motion_translate, opts)
  end
}
