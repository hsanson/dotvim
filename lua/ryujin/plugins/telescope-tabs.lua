return {
	'LukasPietzschmann/telescope-tabs',
  enabled = false,
	config = function()
		require('telescope').load_extension 'telescope-tabs'
		require('telescope-tabs').setup {
      entry_formatter = function(tab_id, _, file_names, _, is_current)
        local success, tab_var = pcall(vim.api.nvim_tabpage_get_var, tab_id, "tab_name")

        if success then
          return string.format('%d: %s%s', tab_id, tab_var, is_current and ' *' or '')
        else
          local entry_string = table.concat(file_names, ', ')
          return string.format('%d: %s%s', tab_id, entry_string, is_current and ' *' or '')
        end
      end,
      entry_ordinal = function(tab_id, _, file_names, _, is_current)
        local success, tab_var = pcall(vim.api.nvim_tabpage_get_var, tab_id, "tab_name")

        if success then
          return tab_var
        else
          return table.concat(file_names, ', ')
        end
      end,
		}

    vim.keymap.set("n", "<leader>t", function()
      require('telescope-tabs').list_tabs()
    end, { desc = "Open tab selector" })
	end,
}
