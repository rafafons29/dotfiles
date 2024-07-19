local util = noty.get_plugin('lspconfig.util')
if not util then return end

return {
  cmd = { 'asm-lsp' },
  filetypes = { 'asm', 'vmasm' },
  root_dir = util.find_git_ancestor,
}
