local Plugin = { 'nvim-treesitter/nvim-treesitter' }

Plugin.dependencies = {
	{ 'nvim-treesitter/nvim-treesitter-context' },
	{ 'nvim-treesitter/nvim-treesitter-textobjects' }
}

-- See :help nvim-treesitter-modules
Plugin.opts = {
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	-- :help nvim-treesitter-textobjects-modules
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			}
		},
	},
	ensure_installed = {
		'javascript',
		'typescript',
		'tsx',
		'lua',
		'vim',
		'vimdoc',
		'css',
		'json',
		'swift',
		'go',
		'python',
		'bash',
		'c',
		'cpp',
		'rust',
		'html',
		'yaml',
		'json',
		'toml',
		'markdown',
		'markdown_inline',
		'sql',
		'objc',
		'java',
	},
}

function Plugin.config(name, opts)
	require('nvim-treesitter.configs').setup(opts)
	require('treesitter-context').setup(
		{
			enable = true,
			max_lines = 0,        -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 20, -- Maximum number of lines to show for a single context
			trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = 'cursor',      -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			zindex = 20, -- The Z-index of the context window
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
		})
end

return Plugin
