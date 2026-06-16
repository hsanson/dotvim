-- Neotest adapters installed first
vim.pack.add({ 'https://github.com/rcasia/neotest-java' }, { load = true })
vim.pack.add({ 'https://github.com/codymikol/neotest-kotlin' }, { load = true })
vim.pack.add({ 'https://github.com/olimorris/neotest-rspec' }, { load = true })
vim.pack.add({
  { src = 'https://github.com/fredrikaverpil/neotest-golang', version = vim.version.range('*') },
  -- NOTE: After installation run: go install gotest.tools/gotestsum@latest
}, { load = true })

vim.pack.add({ 'https://github.com/nvim-neotest/neotest' }, { load = true })

require('neotest').setup({
  adapters = {
    require('neotest-rspec'),
    require('neotest-golang')({
      runner = 'gotestsum',
      go_test_args = {
        '-v',
        '-race',
        '-count=1',
        '-coverprofile=' .. vim.fn.getcwd() .. '/coverage.out',
      },
    }),
  },
})
