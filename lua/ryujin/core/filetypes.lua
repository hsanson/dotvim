vim.filetype.add({
  extension = {
    http = 'http',
    yaml = function(path, bufnr)
      local content = vim.api.nvim_buf_get_lines(bufnr, 0, 20, false)
      for _, line in ipairs(content) do
        if line:match('openapi') then
          return 'openapi.yaml'
        end
      end
      return 'yaml'
    end,
  },
})
