local Plugin = { 'Pocco81/auto-save.nvim' }

function Plugin.config(name, opts)
	require('auto-save').setup({
		enabled = true,
		-- execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
		events = { "InsertLeave", "TextChanged" },
		conditions = {
			exists = true,
			modifiable = true,
		},
		write_all_buffers = false,
		on_off_commands = true,
		clean_command_line_interval = 0,
		debounce_delay = 135,
	})
end

return Plugin

