local Plugin = { "zbirenbaum/copilot.lua" }

Plugin.cmd = { "Copilot" }
Plugin.event = "InsertEnter"

function Plugin.config()
	require("copilot").setup({
  panel = { enabled = false },
		suggestion = {
			enabled = false,
			auto_trigger = true,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				accept = "<M-l>",
				accept_word = false,
				accept_line = false,
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
		},
		filetypes = {
			yaml = true,
			markdown = true,
			help = true,
			gitcommit = true,
			gitrebase = true,
			hgcommit = true,
		},
	})
end



return Plugin
