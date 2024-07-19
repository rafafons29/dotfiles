local bttc = noty.get_plugin("better-comment")
if not bttc then return end

bttc.Setup({
  tags = {
    {
      name = "!",
      fg = "#FF2D00",
      bg = "",
      bold = false,
      virtual_text = "❌",
    },
    {
      name = "`",
      fg = "#3498DB",
      bg = "",
      bold = false,
      virtual_text = " ",
    },
    {
      name = ":",
      fg = "#FF8C00",
      bg = "",
      bold = false,
      virtual_text = " ",
    },
    {
      name = "*",
      fg = "#98C379",
      bg = "",
      bold = false,
    },
    {
      name = "=",
      fg = "#6F51A1",
      bg = "",
      bold = false,
    },
    {
      name = "-",
      fg = "#5E30B0",
      bg = "",
      bold = false,
    },

  }
})
