vim.keymap.set('n', '<localleader>re', function()
    require("usql").select_connection()
  end, { desc = "Usql switch connection", remap = false, buffer = 0 })

vim.keymap.set('n', '<localleader>rr', function()
    require("usql").run_statement()
  end, { desc = "Usql execute SQL statement under the cursor", remap = false, buffer = 0 })

vim.keymap.set('n', '<localleader>rf', function()
    require("usql").run_file()
  end, { desc = "Usql execute SQL file", remap = false, buffer = 0 })
