local Plugin = { 'fatih/vim-go' }

-- 插件的运行命令
Plugin.run = ':GoUpdateBinaries' -- 安装所需的 Go 工具

-- 插件的配置
Plugin.opts = {}

-- 配置函数
function Plugin.config(name, opts)
	vim.g.go_fmt_command = "goimports" -- 默认使用 goimports 进行格式化
	-- 配置快捷键
	-- 运行当前文件的所有测试
	vim.api.nvim_set_keymap('n', '<leader>tt', ':GoTest<CR>', { noremap = true, silent = true })

	-- 运行当前光标所在的测试函数
	vim.api.nvim_set_keymap('n', '<leader>tf', ':GoTestFunc<CR>', { noremap = true, silent = true })

	-- 运行整个包的测试
	vim.api.nvim_set_keymap('n', '<leader>tp', ':GoTest ./...<CR>', { noremap = true, silent = true })
end

return Plugin
