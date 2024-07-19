local ipk = noty.get_plugin('icon-picker')
if not ipk then return end

ipk.setup({
  disable_legacy_commands = true
})

local opts = { noremap = true, silent = true }
keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts)
keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
