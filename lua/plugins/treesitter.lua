local Plugin = { 'nvim-treesitter/nvim-treesitter' }

Plugin.dependencies = {
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
	},
}

function Plugin.config(name, opts)
	require('nvim-treesitter.configs').setup(opts)
	-- 定义 CurrentFunction 函数
	function CurrentFunction()
		local node = require 'nvim-treesitter.ts_utils'.get_node_at_cursor()
		while node do
			if node:type() == 'function' or node:type() == 'method_declaration' or node:type() == 'function_definition' then
				return vim.treesitter.get_node_text(node, 0)
			end
			node = node:parent()
		end
		return "No function"
	end

end

return Plugin
