vim.pack.add({ 'https://github.com/wsdjeg/rooter.nvim' }, { load = true })

require('rooter').setup({
  root_patterns = { '.git/', 'docker-compose.yml', 'Dockerfile' },
  outermost = true,
  enable_cache = true,
  project_non_root = 'current',
  enable_logger = true,
  command = 'tcd',
})

vim.keymap.set('n', '<leader>fp', function() require('snacks').picker.projects() end, {})
