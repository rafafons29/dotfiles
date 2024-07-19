local animate = noty.get_plugin('mini.animate')
local identscope = noty.get_plugin('mini.indentscope')

if not animate then return end
if not identscope then return end

animate.setup({
  cursor = { enable = false },
  open = { enable = false },
  close = { enable = false },
  scroll = { enable = false },
  resize = {
    enable = true,
    timing = animate.gen_timing.linear({ duration = 10, unit = "total" }),
  },
})

identscope.setup({
  options = {
    try_as_border = true,
    border = 'top',
  },
  symbol = '▏',
})
