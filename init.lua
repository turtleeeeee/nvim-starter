local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
load('user.settings')
load('user.commands')
load('user.keymaps')
require('user.plugins')

pcall(vim.cmd.colorscheme, 'darkplus')
