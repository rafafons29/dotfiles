local andromeda = noty.get_plugin("andromeda")
if not andromeda then return end

andromeda.setup({
  preset = "andromeda",
  transparent_bg = false,
  colors = { background = "#292c36" },
  styles = { italic = true }
})

local colors = require("rafa.colors.colors_andromeda")
return colors
