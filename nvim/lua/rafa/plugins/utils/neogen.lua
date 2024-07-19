local neogen = noty.get_plugin('neogen')
if not neogen then return end

neogen.setup {
  enabled = true,             --if you want to disable Neogen
  input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
}

local opts = { noremap = true, silent = true }
keymap.set("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", { desc = "Generate neogen" })
keymap.set("i", "<C-l>", ":lua require('neogen').jump_next<CR>", opts)
keymap.set("i", "<C-h>", ":lua require('neogen').jump_prev<CR>", opts)
