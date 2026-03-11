vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = true
-- vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
-- vim.opt.autoindent = true
-- vim.opt.cindent = true
-- vim.opt.smartindent = true
vim.opt.signcolumn = 'yes'
vim.o.clipboard = "unnamedplus"

vim.opt.termguicolors = true
vim.opt.cursorline = true

-- 加快光标移动速度
vim.opt.updatetime = 100        -- 更快的完成事件触发（默认4000ms）
vim.opt.timeoutlen = 300        -- 按键序列等待时间（默认1000ms）
vim.opt.ttimeoutlen = 10        -- 终端按键码超时时间（加快Esc响应）
vim.opt.ttyfast = true          -- 快速终端连接
vim.opt.lazyredraw = false      -- 确保实时重绘

-- 在 bufferline 下方显示文件相对路径
vim.opt.winbar = " %{%v:lua.require('user.winbar').get()%}"

vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3'
vim.g.jukit_terminal = 'tmux'

vim.api.nvim_create_augroup("UserSetting", { clear = true })
vim.api.nvim_create_autocmd("BufReadPre", {
	group = "UserSetting",
	pattern = { "*.json", "*", "*.log" },
	callback = function()
		local line_count = vim.fn.line("$")
		if line_count > 10000 or vim.fn.getfsize(vim.fn.expand("%")) > 512 * 1024 then
			vim.cmd("syntax clear")
			vim.cmd("syntax off")
			vim.cmd("filetype off")
			vim.opt.foldmethod = "manual"
			vim.opt.swapfile = false
			vim.opt.undofile = false
			vim.opt.loadplugins = false
		end
	end
})

-- 自动检测文件外部改动并重新加载
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	group = "UserSetting",
	pattern = "*",
	callback = function()
		if vim.fn.mode() ~= "c" then
			vim.cmd("checktime")
		end
	end,
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
	group = "UserSetting",
	pattern = "*",
	callback = function()
		vim.notify("文件已在外部被修改，已自动重新加载", vim.log.levels.WARN)
	end,
})

-- 禁用 ripgrep 忽略 .gitignore
-- vim.opt.grepprg = "rg --vimgrep --no-ignore"
-- vim.opt.grepformat = "%f:%l:%c:%m"

-- 禁用 fd 忽略 .gitignore
-- vim.g.telescope_fd_opts = { "--no-ignore" }



-- -- -- 自定义会话管理插件
-- local session_dir = vim.fn.stdpath('data') .. '/sessions/'
--
-- -- 创建会话目录（如果不存在）
-- if vim.fn.isdirectory(session_dir) == 0 then
--   vim.fn.mkdir(session_dir, 'p')
-- end
--
-- -- 获取当前会话文件路径
-- local function get_session_file()
--   return session_dir .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t') .. '.vim'
-- end
--
-- -- 保存会话
-- local function save_session()
--   local session_file = get_session_file()
--
--   -- 关闭NvimTree以避免在保存时状态不一致
--   local nvim_tree_was_open = vim.fn.exists('t:NvimTree') == 1 and require'nvim-tree.view'.is_visible()
--   if nvim_tree_was_open then
--     vim.cmd('NvimTreeClose')
--   end
--
--   -- 保存会话
--   vim.cmd('mksession! ' .. session_file)
--
--   -- 恢复NvimTree
--   if nvim_tree_was_open then
--     vim.cmd('NvimTreeOpen')
--   end
--
--   print('Session saved to ' .. session_file)
-- end
--
-- -- 加载会话
-- local function load_session()
--   local session_file = get_session_file()
--   if vim.fn.filereadable(session_file) == 1 then
--     vim.cmd('source ' .. session_file)
--
--     -- 如果会话中NvimTree打开了，重新打开它
--     if vim.fn.exists('t:NvimTree') == 1 then
--       vim.cmd('NvimTreeRefresh')
--     end
--
--     print('Session loaded from ' .. session_file)
--   else
--     print('No session found for ' .. vim.fn.getcwd())
--   end
-- end
--
-- -- 自动保存和加载会话
-- vim.api.nvim_create_autocmd({'VimLeavePre'}, {
--   pattern = '*',
--   callback = save_session,
-- })
--
-- vim.api.nvim_create_autocmd({'VimEnter'}, {
--   pattern = '*',
--   callback = load_session,
-- })
