local Plugin = {'ray-x/go.nvim'}

-- 插件的配置
Plugin.opts = {}

-- 配置函数
function Plugin.config(name, opts)
  require('go').setup()
end

return Plugin

