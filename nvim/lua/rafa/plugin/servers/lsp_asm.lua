local util = require 'lspconfig.util'

return {
  cmd = { 'asm-lsp' },
  filetypes = { 'asm', 'vmasm' },
  root_dir = util.find_git_ancestor,
}
