local inc_rename = vim.get_plugin('inc_rename')
if not inc_rename then return end

inc_rename.setup {
  presets = { inc_rename = true }
}
