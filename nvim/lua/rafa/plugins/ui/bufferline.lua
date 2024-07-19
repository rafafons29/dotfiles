local bufferline = noty.get_plugin("bufferline")
if not bufferline then return end

return function(colors)
  bufferline.setup({
    options = {
      mode = "tabs",
      separator_style = 'slope',
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      color_icons = true,
      style_preset = bufferline.style_preset.minimal,
    },
    highlights = {
      buffer_selected = {
        fg = colors.normal,
        bold = true,
      },
    },
  })

  vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
  vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
end
