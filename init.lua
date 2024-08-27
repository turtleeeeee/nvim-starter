local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize"
load('user.settings')
load('user.commands')
load('user.keymaps')
require('user.plugins')

pcall(vim.cmd.colorscheme, 'darkplus')
