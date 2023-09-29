-- local feline = {
--   'famiu/feline.nvim',
--   dependencies = {
--     'nvim-tree/nvim-web-devicons',
--     'lewis6991/gitsigns.nvim'
--   },
--   config = function()
--     local feline = require('feline')

--     feline.setup()
--     feline.winbar.setup()
--   end
-- }

local lualine = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/lsp-status.nvim'
  },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {
          {'progress'},
          {function() return require'lsp-status'.status() end}
        },
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      extensions = {}
    })

  end
}

return lualine
