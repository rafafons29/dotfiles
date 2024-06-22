vim.cmd("colorscheme oxocarbon")
vim.opt.background = "dark" -- set this to dark or light

vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
vim.api.nvim_set_hl(1, "NormalFloat", { bg = "none" })


local colors = require("rafa.colors.colors_oxocarbon")
return colors
