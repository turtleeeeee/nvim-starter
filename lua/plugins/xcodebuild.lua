local Plugin = { 'wojciech-kulik/xcodebuild.nvim' }

-- 插件的依赖
Plugin.dependencies = {
	"nvim-telescope/telescope.nvim",
	"MunifTanjim/nui.nvim",
}

-- 插件的配置
Plugin.opts = {
	code_coverage = {
		enabled = true,
	},
}

-- 配置函数
function Plugin.config(name, opts)
	require("xcodebuild").setup(opts)

	-- 配置快捷键
	vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>",
		{ noremap = true, silent = true, desc = "Toggle Xcodebuild Logs" })
	vim.api.nvim_set_keymap("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>",
		{ noremap = true, silent = true, desc = "Build Project" })
	vim.api.nvim_set_keymap("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>",
		{ noremap = true, silent = true, desc = "Build & Run Project" })
	vim.api.nvim_set_keymap("n", "<leader>xt", "<cmd>XcodebuildTest<cr>",
		{ noremap = true, silent = true, desc = "Run Tests" })
	vim.api.nvim_set_keymap("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>",
		{ noremap = true, silent = true, desc = "Run This Test Class" })
	vim.api.nvim_set_keymap("n", "<leader>X", "<cmd>XcodebuildPicker<cr>",
		{ noremap = true, silent = true, desc = "Show All Xcodebuild Actions" })
	vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>",
		{ noremap = true, silent = true, desc = "Select Device" })
	vim.api.nvim_set_keymap("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>",
		{ noremap = true, silent = true, desc = "Select Test Plan" })
	vim.api.nvim_set_keymap("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>",
		{ noremap = true, silent = true, desc = "Toggle Code Coverage" })
	vim.api.nvim_set_keymap("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>",
		{ noremap = true, silent = true, desc = "Show Code Coverage Report" })
	vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Telescope quickfix<cr>",
		{ noremap = true, silent = true, desc = "Show QuickFix List" })
end

return Plugin

