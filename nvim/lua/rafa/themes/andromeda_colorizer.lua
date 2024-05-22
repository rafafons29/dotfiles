local setatus, andromeda = pcall(require, "andromeda")
if not setatus then return end

andromeda.setup({
  preset = "andromeda",
  transparent_bg = false,
})

local colors = require("rafa.colors.colors_andromeda_colorizer")
require("rafa.plugin.lualine.lualine")(colors)
require("rafa.plugin.bufferline.bufferline")(colors)
