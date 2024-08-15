

local Plugin = {'fatih/vim-go'}

-- 插件的运行命令
Plugin.run = ':GoUpdateBinaries'  -- 安装所需的 Go 工具

-- 插件的配置
Plugin.opts = {}

-- 配置函数
function Plugin.config(name, opts)
  vim.g.go_fmt_command = "goimports"  -- 默认使用 goimports 进行格式化
end

return Plugin

