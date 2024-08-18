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
		'go'
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

	-- 在命令行显示当前函数
	vim.cmd [[
    command! ShowCurrentFunction :lua print(CurrentFunction())
  ]]

	-- 将 ShowCurrentFunction 命令绑定到 <leader>cf 快捷键
	vim.api.nvim_set_keymap('n', '<leader>cf', ':ShowCurrentFunction<CR>', { noremap = true, silent = true })
end

return Plugin
