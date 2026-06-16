vim.pack.add({ 'https://github.com/fang2hou/blink-copilot' }, { load = true })
vim.pack.add({ 'https://github.com/Saghen/blink.lib' }, { load = true })
vim.pack.add({ 'https://github.com/Saghen/blink.cmp' }, { load = true })

local blink = require('blink.cmp')

local function ensure_blink_native_matcher()
  local lib_dir = vim.fn.stdpath('data') .. '/site/pack/core/opt/blink.cmp/lib'
  local has_native = #vim.fn.glob(lib_dir .. '/*', false, true) > 0
  if has_native then
    return
  end

  local ok, build = pcall(blink.build)
  if ok and build and build.pwait then
    pcall(function() build:pwait() end)
  end
end

ensure_blink_native_matcher()

blink.setup({
  enabled = function()
    -- Disable in specific filetypes
    local disabled_filetypes = {
      'NvimTree',
      'AgenticInput',
      'snacks_picker_input',
    }

    if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
      return false
    end

    -- Ensure it doesn't trigger in prompt buffers
    if vim.bo.buftype == 'prompt' then
      return false
    end

    return true
  end,

  keymap = {
    preset = 'none',
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
  },

  completion = {
    trigger = {
      prefetch_on_insert = false,
      show_on_trigger_character = false,
    },
    list = {
      selection = {
        preselect = false,
        auto_insert = false,
      },
    },
    menu = {
      border = 'rounded',
    },
    documentation = {
      auto_show = true,
      window = {
        border = 'rounded',
      },
    },
    ghost_text = {
      enabled = false,
    },
  },

  sources = {
    min_keyword_length = 2,
    default = { 'lsp', 'copilot', 'buffer', 'path' },
    providers = {
      lsp = {
        timeout_ms = 300,
      },
      buffer = {
        min_keyword_length = 3,
      },
      copilot = {
        name = 'copilot',
        module = 'blink-copilot',
        score_offset = 100,
        async = true,
        timeout_ms = 300,
        min_keyword_length = 3,
      },
    },
  },

})
