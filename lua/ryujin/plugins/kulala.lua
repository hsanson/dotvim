return {
  -- HTTP REST-Client Interface
  {
    'mistweaverco/kulala.nvim',
    ft = "http",
    config = function()
      -- Setup is required, even if you don't pass any options
      require('kulala').setup({
        default_view = "headers_body",
        default_env = "dev",
        debug = false,
        environment_scope = "g",
        ui = {
          winbar = true,
          default_winbar_panes = { "headers_body", "script_output" },
          icons = {
            inlay = {
              loading = " ",
              done = " ",
              error = " "
            },
            lualine = "🐼",
          },
        },
        global_keymaps = false,
        kulala_keymaps = true,
      })
    end
  },
}
