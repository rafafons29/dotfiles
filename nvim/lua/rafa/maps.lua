-- Definiendo mapleader
vim.g.mapleader = ' '

_G.keymap = vim.keymap

keymap.set('i', 'jj', '<ESC>', { desc = "Go to normal mode" })
keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save' })
keymap.set('n', '<leader>q', '<cmd>quit<cr>', { desc = 'Leave' })
keymap.set('n', '<leader><S-q>', ':bufdo bd|qa<CR>', { noremap = true, desc = "Close all buffers" })
keymap.set({ 'n', 'x' }, 'cp', '"+y', { desc = "Copy select text" })
keymap.set({ 'n', 'x' }, 'cv', '"+p', { desc = "Past the copy text" })
keymap.set({ 'n', 'x' }, 'x', '"_x', { desc = "Cut select text" })
keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<CR>', { desc = "Select all" })
keymap.set('n', '<leader>j', '*``cgn', { desc = "Delete word, and search it" })
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
keymap.set('n', 'dw', 'vb"_d')
keymap.set('n', 'te', ':tabedit', { desc = "Create new tab" })
keymap.set('n', 'ss', ':split<Return><C-w>w', { desc = "Split horizontal window" })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { desc = "Split vertical window" })

-- Move window
keymap.set('n', '<leader>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h', { desc = "Move cursor to left window" })
keymap.set('', 'sk', '<C-w>k', { desc = "Move cursor to up window" })
keymap.set('', 'sj', '<C-w>j', { desc = "Move cursor to down window" })
keymap.set('', 'sl', '<C-w>l', { desc = "Move cursor to right window" })

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><', { desc = "Resize window left" })
keymap.set('n', '<C-w><right>', '<C-w>>', { desc = "Resize window right" })
keymap.set('n', '<C-w><up>', '<C-w>+', { desc = "Resize window up" })
keymap.set('n', '<C-w><down>', '<C-w>-', { desc = "Resize window down" })

keymap.set('v', '>', '>gv', { desc = 'after tab in re-select the same' })
keymap.set('v', '<', '<gv', { desc = 'after tab out re-select the same' })

keymap.set('n', 'n', 'nzzzv', { desc = 'Goes to the next result on the search and put the cursor in the middle' })
keymap.set('n', 'N', 'Nzzzv', { desc = 'Goes to the prev result on the search and put the cursor in the middle' })

-- Jump between markdown headers
keymap.set("n", "gj", [[/^##\+ .*<CR>]], { buffer = true, silent = true })
keymap.set("n", "gk", [[?^##\+ .*<CR>]], { buffer = true, silent = true })

-- Dismiss Noice Message
keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice Message' })

keymap.set("i", "<Tab>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'",
  { expr = true, silent = true })

-- Anotations
keymap.set('n', 'gvv', '<cmd>ComAnnotation<Cr>', { noremap = true, silent = true })

local function cmd(command)
  return table.concat({ '<Cmd>', command, '<CR>' })
end

keymap.set('n', '<C-w>z', cmd 'WindowsMaximize')
keymap.set('n', '<C-w>>', cmd 'WindowsMaximizeVertically')
keymap.set('n', '<C-w>^', cmd 'WindowsMaximizeHorizontally')
keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')
