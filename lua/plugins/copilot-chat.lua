local Plugin = { "CopilotC-Nvim/CopilotChat.nvim" }
Plugin.branch = "canary"
Plugin.dependencies = {
	{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
	{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
}
Plugin.build = "make tiktoken"

function QuickChat()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end

function Plugin.config()
	require("CopilotChat").setup {
		window = {
			layout = 'float',
			relative = 'cursor',
			width = 1,
			height = 0.4,
			row = 1
		},

		-- debug = true, -- Enable debugging
		mappings = {
			complete = {
				detail = 'Use @<Tab> or /<Tab> for options.',
				insert = '<Tab>',
			},
			close = {
				normal = 'q',
				insert = '<C-c>'
			},
			reset = {
				normal = '<C-n>',
				insert = '<C-n>'
			},
			submit_prompt = {
				normal = '<CR>',
				insert = '<C-s>'
			},
			accept_diff = {
				normal = '<C-y>',
				insert = '<C-y>'
			},
			yank_diff = {
				normal = 'cgy',
			},
			show_diff = {
				normal = 'cgd'
			},
			show_system_prompt = {
				normal = 'cgp'
			},
			show_user_selection = {
				normal = 'cgs'
			},
		},
	}
	vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>lua QuickChat()<cr>')
	vim.keymap.set({ 'n', 'v' }, '<leader>ce', '<cmd>CopilotChatExplain<cr>')
	vim.keymap.set({ 'n', 'v' }, '<leader>cf', '<cmd>CopilotChatFix<cr>')
	vim.keymap.set({ 'n', 'v' }, '<leader>cr', '<cmd>CopilotChatReview<cr>')
	vim.keymap.set({ 'n', 'v' }, '<leader>co', '<cmd>CopilotChatOptimize<cr>')
	vim.keymap.set({ 'n', 'v' }, '<leader>cd', '<cmd>CopilotChatDocs<cr>')
	vim.keymap.set({ 'n', 'v' }, '<leader>ct', '<cmd>CopilotChatTests<cr>')
end

return Plugin
