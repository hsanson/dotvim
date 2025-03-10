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
        environment_scope = "g",
        ui = {
          winbar = true,
          default_winbar_panes = { "body", "headers", "headers_body", "script_output" },
          icons = {
            inlay = {
              loading = " ",
              done = " ",
              error = " "
            },
            lualine = "🐼",
          },
        },
        contenttypes = {
          ["application/vnd.api+json"] = {
            ft = "kulala-ui",
            formatter = { "jq", "." },
            pathresolver = require("kulala.parser.jsonpath").parse,
          },
          ["application/json"] = {
            ft = "kulala-ui",
            formatter = { "jq", "." },
            pathresolver = require("kulala.parser.jsonpath").parse,
          },
          ["application/xml"] = {
            ft = "kulala-ui",
            formatter = { "xmllint", "--format", "-" },
            pathresolver = { "xmllint", "--xpath", "{{path}}", "-" },
          },
          ["text/html"] = {
            ft = "kulala-ui",
            formatter = { "xmllint", "--format", "--html", "-" },
            pathresolver = {},
          },
        },
        additional_curl_options = {},
      })
    end
  },
}
