return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    signature = {
      enabled = true,
      window = { border = 'single' }
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    completion = {
      documentation = {
        auto_show = false, auto_show_delay_ms = 500,
        window = { border = 'single' }
      },
      menu = {
        border = 'single',
      },
      ghost_text = { enabled = true }
    },

  },
  opts_extend = { "sources.default" }
}
