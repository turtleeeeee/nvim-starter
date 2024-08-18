local Plugin = { 'lewis6991/gitsigns.nvim' }

Plugin.event = { 'BufReadPre', 'BufNewFile' }

-- See :help gitsigns-usage
Plugin.opts = {
	signs = {
		add = { text = '▎' },
		change = { text = '▎' },
		delete = { text = '➤' },
		topdelete = { text = '➤' },
		changedelete = { text = '▎' },
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- 快捷键映射
		map('n', '<leader>gd', gs.diffthis)                             -- 查看当前文件的 diff
		map('n', '<leader>gb', gs.blame_line)                           -- 查看当前行的 blame 信息
		map('n', '<leader>gD', function() gs.diffthis('~') end)         -- 对比当前文件和上一个提交
		map('n', '<leader>gB', function() gs.blame_line { full = true } end) -- 查看当前行的详细 blame 信息
		map('n', '<leader>gS', gs.stage_hunk)                           -- 暂存当前 hunk
		map('n', '<leader>gu', gs.undo_stage_hunk)                      -- 撤销暂存当前 hunk
		map('n', '<leader>gR', gs.reset_hunk)                           -- 重置当前 hunk
		map('n', '<leader>gp', gs.preview_hunk)                         -- 预览当前 hunk 的 diff
		map('n', '<leader>gr', gs.reset_buffer)                         -- 重置整个 buffer
		map('n', '<leader>gB', gs.toggle_current_line_blame)            -- 切换当前行的 blame 信息显示
		map('n', '<leader>gd', gs.toggle_deleted)                       -- 切换显示已删除的行
	end
}

return Plugin
