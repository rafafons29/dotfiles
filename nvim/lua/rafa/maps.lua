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

-- Open terminal on different modes
keymap.set('n', '<C-v>', '<cmd>ToggleTerm size=80 direction=vertical<CR>')
keymap.set('n', '<C-m>', '<cmd>ToggleTerm size=70 direction=horizontal<CR>')

-- Jump between markdown headers
vim.keymap.set("n", "gj", [[/^##\+ .*<CR>]], { buffer = true, silent = true })
vim.keymap.set("n", "gk", [[?^##\+ .*<CR>]], { buffer = true, silent = true })

-- Dismiss Noice Message
keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice Message' })

keymap.set("i", "<Tab>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'",
  { expr = true, silent = true })

keymap.set("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", { silent = true })
keymap.set("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<Cr>", { silent = true })
keymap.set("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<Cr>", { silent = true })
keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
keymap.set('i', '<M-e>', '<cmd>EmojiPicker<cr>')
keymap.set('n', '<C-w>o', '<cmd>ZenMode<cr>', { silent = true })
keymap.set('n', '<Leader>D', '<cmd>MultipleCursorsAddDow<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>U', '<cmd>MultipleCursorsAddUp<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>dr', '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>dq', '<cmd>lua require"dap".close()<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>',
  { noremap = true, silent = true })
keymap.set("i", "<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
  { expr = true, silent = true })
keymap.set("s", "<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
  { expr = true, silent = true })

keymap.set("n", "<leader>mf", function()
  require('md-pdf').convert_md_to_pdf()
end)

-- Keymaos for telescope
vim.keymap.set('n', ';f',
  function()
    vim.builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', ';r', function()
  vim.builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
  vim.builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
  vim.builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
  vim.builtin.resume()
end)
vim.keymap.set('n', ';e', function()
  vim.builtin.diagnostics()
end)
vim.keymap.set('n', ';s', function()
  vim.builtin.current_buffer_fuzzy_find()
end)
vim.keymap.set("n", "sf", function()
  vim.telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = vim.telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 20 }
  })
end)

-- Icons on telescope
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts)
vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

vim.keymap.set('n', "<leader>rn", ":IncRename ")
vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
