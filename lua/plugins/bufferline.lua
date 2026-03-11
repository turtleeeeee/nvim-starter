local Plugin = {'akinsho/bufferline.nvim'}

Plugin.event = 'VeryLazy'

Plugin.opts = {
  options = {
    mode = 'buffers',
    offsets = {
      {filetype = 'NvimTree'}
    },
    -- 只显示文件名，相对路径通过 winbar 显示
    name_formatter = function(buf)
      return vim.fn.fnamemodify(buf.path, ':t')
    end,
  },
  -- :help bufferline-highlights
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = {attribute = 'fg', highlight = 'Function'},
      italic = false
    }
  }
}

return Plugin
