local lualine = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    'linrongbin16/lsp-progress.nvim'
  },
  config = function()
    local lualine = require("lualine")
    local g = vim.g

    local filename_module = {
      'filename',
      file_status = true,
      newfile_status = true,
      path = 1,                -- 0: Just the filename
                               -- 1: Relative path
                               -- 2: Absolute path
                               -- 3: Absolute path, with tilde as the home directory
                               -- 4: Filename and parent dir, with tilde as the home directory

      shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                               -- for other components. (terrible name, any suggestions?)
      symbols = {
        modified = 'ﰂ ',      -- Text to show when the file is modified.
        readonly = ' ',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = ' ',     -- Text to show for newly created file before first write
      }
    }

    local diff_module = {
       'diff',
      colored = false,

      symbols = {
        added = '+',
        modified = '~',
        removed = '-'
      },
    }

    local function progress_module()
      local cur = vim.fn.line('.')
      local total = vim.fn.line('$')
      local icons = {
        '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''
      }
      local percent = math.floor(cur / total * 100)
      local position = 1 + math.floor(percent / (100 / (#(icons) - 1)))

      -- return string.format('%s %d %2d%%%%', icons[position], percent)
      return string.format('%s', icons[position])
    end

    local function lsp_progress()
      return require("lsp-progress").progress({
        format = function(messages)
          if #messages > 0 then
            -- Some LSP progress messages contain `%` characters (e.g. jdtls)
            -- that break lsp-progress with cryptic Illegal Character errors.
            -- This code tries to sanitize the messages so things do not break.
            local sanitized = vim.tbl_map(function(val)
              local subs, _ = string.gsub(val, '(%d+)%% ', '%1%%%%')
              return subs
            end, messages)

            return table.concat(sanitized, " ")
          end

          return ""
        end
      })
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        section_separators = { left = ' ', right = ' '},
        component_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          { 'branch', icon = "" },
          diff_module
        },
        lualine_c = {
          filename_module
        },
        lualine_x = {
          { lsp_progress },
          'kulala',
        },
        lualine_y = {
          {
            'diagnostics',
            symbols = {
              error = g.symbol_error .. ' ',
              warn = g.symbol_warn .. ' ',
              info = g.symbol_info .. ' ',
              hint = g.symbol_hint .. ' '
            },
          },
          { 'lsp-status' },
          { 'usql' },
          { 'filetype' },
          { function() return progress_module() end }
        },
        lualine_z = {'location'}
      },
      inactive_sections = {},
      tabline = {},
      extensions = {}
    })

  end
}

return lualine
