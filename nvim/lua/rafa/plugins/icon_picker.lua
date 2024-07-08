local ipk = vim.get_plugin('icon-picker')
if not ipk then return end

ipk.setup({
  disable_legacy_commands = true
})
