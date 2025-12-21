local lualine = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
  config = function()
    local lualine = require("lualine")
    local g = vim.g

    local filename_module = {
      "filename",
      file_status = true,
      newfile_status = true,
      path = 1, -- 0: Just the filename
      -- 1: Relative path
      -- 2: Absolute path
      -- 3: Absolute path, with tilde as the home directory
      -- 4: Filename and parent dir, with tilde as the home directory

      shorting_target = 40, -- Shortens path to leave 40 spaces in the window
      -- for other components. (terrible name, any suggestions?)
      symbols = {
        modified = "ﰂ ", -- Text to show when the file is modified.
        readonly = " ", -- Text to show when the file is non-modifiable or readonly.
        unnamed = "[No Name]", -- Text to show for unnamed buffers.
        newfile = " ", -- Text to show for newly created file before first write
      },
    }

    local diff_module = {
      "diff",
      colored = false,

      symbols = {
        added = " ",
        modified = " ",
        removed = " ",
      },
    }

    local function progress_module()
      local cur = vim.fn.line(".")
      local total = vim.fn.line("$")
      local icons = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      }
      local percent = math.floor(cur / total * 100)
      local position = 1 + math.floor(percent / (100 / (#icons - 1)))

      -- return string.format('%s %d %2d%%%%', icons[position], percent)
      return string.format("%s", icons[position])
    end

    local function current_root()
      local rooter = require("rooter")
      local path = rooter.current_root()
      path = string.gsub(path, "/$", "") -- remove last / if present
      path = vim.fn.fnamemodify(path, ":t")
      return string.format("%s", path)
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {
            'AgenticChat',
            'AgenticInput',
            'AgenticCode',
            'AgenticFiles',
          },
          winbar = {
            'AgenticChat',
            'AgenticInput',
            'AgenticCode',
            'AgenticFiles',
            "dap-view",
            "dap-repl",
            "nvim-dap-view",
            "kulala_ui",
            "help",
            "terminal",
            "nofile",
          },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          function()
            return current_root()
          end,
        },
        lualine_c = {
          { "branch", icon = "" },
          diff_module,
        },
        lualine_x = {
          "kulala",
          {
            "copilot",
            -- Default values
            symbols = {
              status = {
                icons = {
                  enabled = " ",
                  sleep = " ", -- auto-trigger disabled
                  disabled = " ",
                  warning = " ",
                  unknown = " ",
                },
                hl = {
                  enabled = "#50FA7B",
                  sleep = "#AEB7D0",
                  disabled = "#6272A4",
                  warning = "#FFB86C",
                  unknown = "#FF5555",
                },
              },
              spinners = "meter", -- has some premade spinners
              spinner_color = "#6272A4",
            },
            show_colors = false,
            show_loading = true,
          },
        },
        lualine_y = {
          {

            "diagnostics",
            symbols = {
              error = g.symbol_error .. " ",
              warn = g.symbol_warn .. " ",
              info = g.symbol_info .. " ",
              hint = g.symbol_hint .. " ",
            },
          },
          { "lsp-status" },
          { "usql" },
          {
            function()
              return progress_module()
            end,
          },
        },
        lualine_z = { "location" },
      },
      inactive_sections = {},
      tabline = {},
      winbar = {
        lualine_a = {
          { "filetype" },
        },
        lualine_b = {},
        lualine_c = { filename_module },
        lualine_x = {},
        lualine_y = {
					{
						"lualine-coverage",
						scope = "file",
					},
				},
        lualine_z = { "encoding", "fileformat" },
      },
      inactive_winbar = {
        lualine_a = {
          { "filetype" },
        },
        lualine_b = {},
        lualine_c = { filename_module },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "encoding", "fileformat" },
      },
      extensions = {},
    })
  end,
}

return lualine
