local andromeda = vim.get_plugin("andromeda")
if not andromeda then return end

andromeda.setup({
  preset = "andromeda",
  transparent_bg = false,
})

local colors = require("rafa.colors.colors_andromeda")
return colors
