local Plugin = { 'rmagatti/auto-session' }

Plugin.dependencies = {
	{ 'nvim-telescope/telescope.nvim' },
}
Plugin.lazy = false

function Plugin.config(name, opts)
	require('auto-session').setup({
		auto_restore_enabled = true,
		auto_save_enabled = true,
		log_level = 'info',
	})
end

return Plugin
