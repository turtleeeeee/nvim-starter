local M = {}

local icons = {
	separator = " › ",
	file = " ",
	modified = " ●",
}

function M.get()
	local bufnr = vim.api.nvim_get_current_buf()
	local bufname = vim.api.nvim_buf_get_name(bufnr)

	-- 跳过特殊 buffer
	local filetype = vim.bo[bufnr].filetype
	if filetype == "NvimTree" or filetype == "toggleterm" or filetype == "TelescopePrompt" or bufname == "" then
		return ""
	end

	local path = vim.fn.fnamemodify(bufname, ":.")
	local parts = vim.split(path, "/", { plain = true })

	if #parts == 0 then
		return ""
	end

	local result = {}

	-- 目录部分用较暗的颜色
	for i = 1, #parts - 1 do
		table.insert(result, "%#WinBarPath#" .. parts[i])
		table.insert(result, "%#WinBarSep#" .. icons.separator)
	end

	-- 文件名用高亮颜色
	table.insert(result, "%#WinBarFile#" .. icons.file .. parts[#parts])

	-- 修改标记
	if vim.bo[bufnr].modified then
		table.insert(result, "%#WinBarModified#" .. icons.modified)
	end

	return table.concat(result)
end

-- 设置高亮组
local function setup_highlights()
	vim.api.nvim_set_hl(0, "WinBarPath", { fg = "#7a7a7a", bold = false })
	vim.api.nvim_set_hl(0, "WinBarSep", { fg = "#5a5a5a" })
	vim.api.nvim_set_hl(0, "WinBarFile", { fg = "#c8c8c8", bold = true })
	vim.api.nvim_set_hl(0, "WinBarModified", { fg = "#e5c07b" })
end

setup_highlights()

-- colorscheme 改变时重新设置高亮
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = setup_highlights,
})

return M

