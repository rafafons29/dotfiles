local flash = noty.get_plugin("flash")
if not flash then return end

keymap.set({ 'n', 'x', 'o' }, 's', function() flash.jump() end, { desc = "Flash" })
keymap.set({ 'n', 'x', 'o' }, 'S', function() flash.treesitter() end, { desc = "Flash Treesitter" })
keymap.set({ 'o' }, 'r', function() flash.remote() end, { desc = "Remote Flash" })
keymap.set({ 'o', 'x' }, 'R', function() flash.treesitter_search() end, { desc = "Treesitter Search" })
keymap.set({ 'c' }, '<C-s>', function() flash.toggle() end, { desc = "Toggle Flash Search" })
