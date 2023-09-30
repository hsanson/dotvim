return {
  "potamides/pantran.nvim",
  config = function()
    local pantran = require("pantran")
    local opts = {noremap = true, silent = true, expr = true}

    pantran.setup({
      default_engine = "argos",
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
