local inc_rename = noty.get_plugin('inc_rename')
if not inc_rename then return end

inc_rename.setup {
  presets = { inc_rename = true }
}

keymap.set("n", "<leader>rn", ":IncRename ")
keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
