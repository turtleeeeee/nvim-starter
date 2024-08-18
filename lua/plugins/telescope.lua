local Plugin = { 'nvim-telescope/telescope.nvim' }

Plugin.branch = '0.1.x'

Plugin.dependencies = {
	{ 'nvim-lua/plenary.nvim' },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}

Plugin.cmd = { 'Telescope' }

function Plugin.init()
	-- See :help telescope.builtin
	vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
	vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
	vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
	vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
	vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
	vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
	vim.keymap.set('n', '<leader>p', '<cmd>Telescope lsp_document_symbols<cr>')
end

function Plugin.config()
	local actions = require('telescope.actions')
	local action_state = require('telescope.actions.state')
	require('telescope').setup {
		defaults = {
			mappings = {
				i = {
					-- 使用 'v' 键竖屏分割打开文件
					["<C-v>"] = function(prompt_bufnr)
						local selected_entry = action_state.get_selected_entry()
						actions.close(prompt_bufnr)
						vim.cmd('vsplit ' .. selected_entry.value)
					end,
					-- 使用 'h' 键水平分割打开文件
					["<C-h>"] = function(prompt_bufnr)
						local selected_entry = action_state.get_selected_entry()
						actions.close(prompt_bufnr)
						vim.cmd('split ' .. selected_entry.value)
					end,
				},
				n = {
					-- 在正常模式下配置 'v' 键竖屏分割打开文件
					["<C-v>"] = function(prompt_bufnr)
						local selected_entry = action_state.get_selected_entry()
						actions.close(prompt_bufnr)
						vim.cmd('vsplit ' .. selected_entry.value)
					end,
					-- 在正常模式下配置 'h' 键水平分割打开文件
					["<C-h>"] = function(prompt_bufnr)
						local selected_entry = action_state.get_selected_entry()
						actions.close(prompt_bufnr)
						vim.cmd('split ' .. selected_entry.value)
					end,
				},
			},
		},
	}
	require('telescope').load_extension('fzf')
end

return Plugin
