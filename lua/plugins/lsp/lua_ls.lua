local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.lua_ls.setup({
	capabilities = lsp_capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				version = 'LuaJIT',
				path = runtime_path
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' }
			},
			workspace = {
				library = {
					-- Make the server aware of Neovim runtime files
					vim.fn.expand('$VIMRUNTIME/lua'),
					vim.fn.stdpath('config') .. '/lua'
				},
				checkThirdParty = false
			},
			telemetry = {
				enable = false
			},
		}
	}
})

lspconfig.sourcekit.setup({
	capabilities = lsp_capabilities,
	cmd = { 'sourcekit-lsp' },
	filetypes = { 'swift', 'objective-c', 'objective-cpp', 'c', 'cpp' },
	--root_pattern("buildServer.json", "*.xcodeproj", "*.xcworkspace", "compile_commands.json", "Package.swift", ".git")
	root_dir = lspconfig.util.root_pattern("Package.swift", ".git", "buildServer.json", "*.xcodeproj", "*.xcworkspace",
		"compile_commands.json"),
	settings = {
		sourcekit = {
			buildConfiguration = 'Debug',
			trace = 'verbose'
		}
	}
})
