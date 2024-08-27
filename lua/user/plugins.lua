local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end

	-- You can "comment out" the line below after lazy.nvim is installed
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)

	require('lazy').setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
	{ import = 'plugins' },
	-- {
	-- 	'rmagatti/auto-session',
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		'nvim-telescope/telescope.nvim', -- Only needed if you want to use session lens
	-- 	},
	-- 	opts = {
	-- 		auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
	-- 		-- log_level = 'debug',
	-- 		log_level = 'info',
	-- 		auto_session_enable_last_session = true,
	-- 		auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
	-- 		auto_session_enabled = true,
	-- 		auto_save_enabled = true,
	-- 		auto_restore_enabled = true,
	-- 	},
	-- },
})
