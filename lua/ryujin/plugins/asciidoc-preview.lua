return {
  'tigion/nvim-asciidoc-preview',
  ft = { 'asciidoc' },
  build = 'cd server && npm install --omit=dev --no-save',
  ---@module 'asciidoc-preview'
  opts = {
    -- Add user configuration here
  },
}
