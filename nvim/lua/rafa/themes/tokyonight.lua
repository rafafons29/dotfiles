vim.g.tokyonight_style = 'night' -- available: night, storm
vim.g.tokyonight_transparent_background = 0
vim.g.tokyonight_menu_selection_background = 'green'
vim.g.tokyonight_disable_italic_comment = 0
vim.g.tokyonight_enable_italic = 1
vim.g.tokyonight_cursor = 'auto'
vim.g.tokyonight_current_word = 'bold' -- bold, underline, italic, grey background
vim.g.airline_theme = "tokyonight"
vim.cmd("colorscheme tokyonight")

local colors = require("rafa.colors.colors_tokyonight")
return colors
