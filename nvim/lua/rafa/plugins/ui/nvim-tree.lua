local status, tree = pcall(require, "nvim-tree")
if not status then
  return
end

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

tree.setup({
  hijack_cursor = true,
  view = {
    width = 30,
    side = "right",
    cursorline = false,
    number = true,
    relativenumber = true,
  },
  renderer = {
    root_folder_label = false,
    indent_markers = {
      enable = true,
      inline_arrows = true,
    },
    icons = {
      show = {
        folder_arrow = false,
      },
      glyphs = {
        folder = {
          default = "󰉋",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },

  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- See :help nvim-tree.api
    local api = require('nvim-tree.api')

    bufmap('L', api.node.open.edit, 'Expand folder or go to file')
    bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
    bufmap('a', api.fs.create, 'Create folder or file in the concurrent path.')
  end,
})
