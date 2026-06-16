-- Lualine component dependencies loaded first
vim.pack.add({ 'https://github.com/AndreM222/copilot-lualine' }, { load = true })
vim.pack.add({ 'https://github.com/pnx/lualine-lsp-status' }, { load = true })
vim.pack.add({ 'https://github.com/hsanson/coverage-lualine' }, { load = true })

vim.pack.add({ 'https://github.com/linrongbin16/lsp-progress.nvim' }, { load = true })

require('lsp-progress').setup()

vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('LualineLspProgressGroup', { clear = true }),
  pattern = 'LspProgressStatusUpdated',
  callback = function()
    local ok, lualine = pcall(require, 'lualine')
    if ok then lualine.refresh() end
  end,
})

vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' }, { load = true })

local g = vim.g

local filename_module = {
  'filename',
  file_status = true,
  newfile_status = true,
  path = 1,
  shorting_target = 40,
  symbols = {
    modified = 'ﰂ ',
    readonly = ' ',
    unnamed = '[No Name]',
    newfile = ' ',
  },
}

local diff_module = {
  'diff',
  colored = false,
  symbols = {
    added = ' ',
    modified = ' ',
    removed = ' ',
  },
}

local function progress_module()
  local cur = vim.fn.line('.')
  local total = vim.fn.line('$')
  local icons = {
    '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '',
  }
  local percent = math.floor(cur / total * 100)
  local position = 1 + math.floor(percent / (100 / (#icons - 1)))
  return string.format('%s', icons[position])
end

local function current_root()
  local rooter = require('rooter')
  local path = rooter.current_root()
  path = string.gsub(path, '/$', '')
  path = vim.fn.fnamemodify(path, ':t')
  return string.format('%s', path)
end

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {
        'AgenticChat', 'AgenticInput', 'AgenticCode', 'AgenticFiles',
      },
      winbar = {
        'AgenticChat', 'AgenticInput', 'AgenticCode', 'AgenticFiles',
        'opencode', 'opencode_output', 'dap-view', 'dap-repl',
        'nvim-dap-view', 'kulala_ui', 'help', 'terminal', 'nofile',
        'trouble',
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
    lualine_a = { 'mode' },
    lualine_b = {
      function() return current_root() end,
    },
    lualine_c = {
      { 'branch', icon = '' },
      diff_module,
    },
    lualine_x = {
      'kulala',
      {
        'copilot',
        symbols = {
          status = {
            icons = {
              enabled = ' ',
              sleep = ' ',
              disabled = ' ',
              warning = ' ',
              unknown = ' ',
            },
            hl = {
              enabled = '#50FA7B',
              sleep = '#AEB7D0',
              disabled = '#6272A4',
              warning = '#FFB86C',
              unknown = '#FF5555',
            },
          },
          spinners = 'meter',
          spinner_color = '#6272A4',
        },
        show_colors = false,
        show_loading = true,
      },
    },
    lualine_y = {
      {
        'diagnostics',
        symbols = {
          error = g.symbol_error .. ' ',
          warn = g.symbol_warn .. ' ',
          info = g.symbol_info .. ' ',
          hint = g.symbol_hint .. ' ',
        },
      },
      { 'lsp-status' },
      { 'usql' },
      {
        function() return progress_module() end,
      },
    },
    lualine_z = { 'location' },
  },
  inactive_sections = {},
  tabline = {},
  winbar = {
    lualine_a = { { 'filetype' } },
    lualine_b = {},
    lualine_c = { filename_module },
    lualine_x = {},
    lualine_y = {
      {
        'lualine-coverage',
        scope = 'file',
      },
    },
    lualine_z = { 'encoding', 'fileformat' },
  },
  inactive_winbar = {
    lualine_a = { { 'filetype' } },
    lualine_b = {},
    lualine_c = { filename_module },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'encoding', 'fileformat' },
  },
  extensions = {},
})
