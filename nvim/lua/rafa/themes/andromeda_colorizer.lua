local andromeda = noty.get_plugin("andromeda")
if not andromeda then return end

andromeda.setup({
  preset = "andromeda",
  transparent_bg = false,
  styles = { italic = true },
  colors = {
    background = "#1e1e1f",
    mono_1 = "#2e2e2e",
    mono_2 = "#3a3c3e",
    mono_3 = "#6F6F6F",
    mono_4 = "#ee5d43",
    mono_5 = "#B3ACA7",
    mono_6 = "#B3ACB7",
  },
})

local colors = require("rafa.colors.colors_andromeda_colorizer")
return colors
