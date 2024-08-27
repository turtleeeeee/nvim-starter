local Plugin = { 'Pocco81/auto-save.nvim' }

-- Plugin.events = { "VimLeave"}

function Plugin.config(name, opts)
	require('auto-save').setup({
		enabled = true,
		-- execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
		events = { "VimLeave", "BufLeave" },
		conditions = {
			exists = true,
			modifiable = true,
		},
		write_all_buffers = false,
		on_off_commands = true,
		clean_command_line_interval = 0,
		debounce_delay = 135,
	})
  vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
end

return Plugin

