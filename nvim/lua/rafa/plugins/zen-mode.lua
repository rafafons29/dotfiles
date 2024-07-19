local zenMode = noty.get_plugin("zen-mode")
if not zenMode then return end

zenMode.setup {}

keymap.set('n', '<C-w>o', '<cmd>ZenMode<cr>', { silent = true })
