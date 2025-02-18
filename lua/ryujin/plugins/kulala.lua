return {
  -- HTTP REST-Client Interface
  {
    'mistweaverco/kulala.nvim',
    ft = "http",
    config = function()
      -- Setup is required, even if you don't pass any options
      require('kulala').setup({
        default_view = "body",
        default_env = "dev",
        debug = true,
        default_winbar_panes = { "body", "headers", "headers_body", "script_output" },
        winbar = true,
        environment_scope = "g",
        icons = {
          inlay = {
            loading = " ",
            done = " ",
            error = " "
          },
          lualine = "🐼",
        },
        additional_curl_options = {},
      })
    end
  },
}
