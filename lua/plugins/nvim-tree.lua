local Plugin = {'kyazdani42/nvim-tree.lua'}

Plugin.cmd = {'NvimTreeToggle'}

-- See :help nvim-tree-setup
Plugin.opts = {
  hijack_cursor = false,
  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
    end

    -- :help nvim-tree.api
    local api = require('nvim-tree.api')

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    bufmap('L', api.node.open.edit, 'Expand folder or go to file')
    bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
  end
}

function Plugin.init()
  vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
	  -- 自动打开 Nvim-Tree
  vim.api.nvim_create_autocmd("VimEnter", {
      callback = function(data)
          -- 仅当 Neovim 启动时没有指定文件时，才打开 Nvim-Tree
          local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
          local directory = vim.fn.isdirectory(data.file) == 1

          if not no_name and not directory then
              return
          end

          -- 打开 Nvim-Tree
          require("nvim-tree.api").tree.open()
      end
  })
end

return Plugin
