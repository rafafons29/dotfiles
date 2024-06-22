return function(colors)
  local highlight_colors = {
    ["RainbowCyan"] = colors.cyan,
    ["RainbowGreen"] = colors.green,
    ["RainbowRed"] = colors.red,
    ["RainbowViolet"] = colors.violet,
    ["RainbowBlue"] = colors.blue,
    ["RainbowYellow"] = colors.yellow,
    ["RainbowOrange"] = colors.orange,
  }

  function highlight()
    local highlight_list = {}
    for highlight, _ in pairs(highlight_colors) do
      table.insert(highlight_list, highlight)
    end
    return highlight_list
  end

  local hooks = vim.get_plugin("ibl.hooks")
  if not hooks then return end

  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    for rainbow, color in pairs(highlight_colors) do
      vim.api.nvim_set_hl(0, rainbow, { fg = color });
    end
  end)

  vim.g.rainbow_delimiters = { highlight = highlight() }

  local ibl = vim.get_plugin("ibl")
  if not ibl then return end

  ibl.setup {
    scope = { highlight = highlight() }, -- show_start = true, show_end = false
    indent = { char = "▏" }
  }
  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end
