Plugin = { 'phaazon/hop.nvim' }

Plugin.branch = 'v2'

function Plugin.config()
	local hop = require('hop')
	local directions = require('hop.hint').HintDirection

	hop.setup({})

	-- 这里是键位映射的部分
	vim.keymap.set('', 'f', function()
		hop.hint_anywhere({})
	end, { remap = true })

	vim.keymap.set('', 'fi', function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
	end, { remap = true })


	vim.keymap.set('', 'F', function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
	end, { remap = true })

	vim.keymap.set('', 't', function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
	end, { remap = true })

	vim.keymap.set('', 'T', function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
	end, { remap = true })
end

return Plugin
