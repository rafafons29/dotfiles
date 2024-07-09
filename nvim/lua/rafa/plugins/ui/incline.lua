local devicons = vim.get_plugin('nvim-web-devicons')
local incline = vim.get_plugin('incline')

if not devicons then return end
if not incline then return end

return function(colors)
  return incline.setup {
    highlight = {
      groups = {
        InclineNormal = { guibg = colors.bg_b_y, guifg = colors.normal },
        InclineNormalNC = { guibg = colors.base, guifg = colors.fg_a_z }
      }
    },
    window = {
      margin = { vertical = 0, horizontal = 0 },
    },
    hide = {
      cursorline = true
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
      if filename == '' then
        filename = '[No Name]'
      end
      local ft_icon, ft_color = devicons.get_icon_color(filename)

      local function get_diagnostic_label()
        local icons = { error = '', warn = '', info = '', hint = '' }
        local label = {}

        for severity, icon in pairs(icons) do
          local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
          if n > 0 then
            table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
          end
        end
        if #label > 0 then
          table.insert(label, { '| ' })
        end
        return label
      end

      return {
        { get_diagnostic_label() },
        { (ft_icon or '') .. ' ', guifg = ft_color,                                            guibg = 'none' },
        { filename .. ' ',        gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
      }
    end,
  }
end
