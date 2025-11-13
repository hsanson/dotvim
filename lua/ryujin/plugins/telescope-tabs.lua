return {
	'LukasPietzschmann/telescope-tabs',
	config = function()
		require('telescope').load_extension 'telescope-tabs'
		require('telescope-tabs').setup {
			-- Your custom config :^)
		}

    vim.keymap.set("n", "<leader>t", function()
      require('telescope-tabs').list_tabs()
    end, { desc = "Open tab selector" })
	end,
}
