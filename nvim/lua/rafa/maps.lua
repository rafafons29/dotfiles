-- Definiendo mapleader
vim.g.mapleader = ' '

_G.keymap = vim.keymap

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
vim.keymap.set('n', 'gvv', '<cmd>ComAnnotation<Cr>', { noremap = true, silent = true })
