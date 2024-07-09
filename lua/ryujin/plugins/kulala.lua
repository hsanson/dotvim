return {
  -- HTTP REST-Client Interface
  {
    'mistweaverco/kulala.nvim',
    ft = "http",
    config = function()
      -- Setup is required, even if you don't pass any options
      require('kulala').setup({
        -- default_view, body or headers
        default_view = "body",
        -- dev, test, prod, can be anything
        -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
        default_env = "dev",
        -- enable/disable debug mode
        debug = false,
        -- default icons
        icons = {
          inlay = {
            loading = "⏳",
            done = "✅ "
          },
          lualine = "",
        },
        -- additional cURL options
        -- e.g. { "--insecure", "-A", "Mozilla/5.0" }
        additional_curl_options = {},
      })
    end
  },
}
