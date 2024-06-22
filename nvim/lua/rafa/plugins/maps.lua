-- Definiendo mapleader
vim.g.mapleader = ' '

local keymap = vim.keymap

-- Pasar al modo normal
keymap.set('i', 'jj', '<ESC>')

-- la combinación Espacio + w nos permitirá usar el comando write
keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Guardar' })

-- La combinación Espacio + q nos permite salir del archivo actual en el que estamos
keymap.set('n', '<leader>q', '<cmd>quit<cr>', { desc = 'Salir' })
keymap.set('n', '<leader><S-q>', ':bufdo bd|qa<CR>', { noremap = true })

-- Copiar al portapapeles
keymap.set({ 'n', 'x' }, 'cp', '"+y')

-- Pegar desde el portapapeles
keymap.set({ 'n', 'x' }, 'cv', '"+p')

-- Modificar x para no alterar el historial de copias
keymap.set({ 'n', 'x' }, 'x', '"_x')

-- Seleccionar todo el texto
keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<CR>')

-- Cambiar una palabra y navegar por todas las demas coincidencias
keymap.set('n', '<leader>j', '*``cgn')

-- Mostrar Netrw a la derecha de la pantalla
keymap.set('n', '<leader>de', ':Vexplore! %:p:h<CR>')

-- Mostrar Netrw en toda la pantalla
keymap.set('n', '<leader>dd', ':Explore %:p:h<CR>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<leader>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- LuaSnipets maps
-- press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
vim.api.nvim_set_keymap("i", "<Tab>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'",
  { expr = true, silent = true })

-- -1 for jumping backwards.
vim.api.nvim_set_keymap("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", { silent = true })

vim.api.nvim_set_keymap("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<Cr>", { silent = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<Cr>", { silent = true })

-- For changing choices in choiceNodes (not strictly necessary for a basic setup).
vim.api.nvim_set_keymap("i", "<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
  { expr = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
  { expr = true, silent = true })

vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

vim.keymap.set('n', '<C-w>o', '<cmd>ZenMode<cr>', { silent = true })

vim.api.nvim_set_keymap('n', '<Leader>D', '<cmd>MultipleCursorsAddDow<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>U', '<cmd>MultipleCursorsAddUp<CR>', { noremap = true, silent = true })
