local Plugin = { 'aserowy/tmux.nvim' }

Plugin.config = function(name, opts)
  require("tmux").setup()
end

return Plugin
