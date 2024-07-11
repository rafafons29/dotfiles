local function minimal_theme(colors)
  return {
    normal = {
      a = { fg = colors.fg_a_z, bg = colors.normal },
      b = { fg = colors.fg_b_y },
      c = { fg = colors.insert },
      x = { fg = colors.insert },
      y = { fg = colors.fg_b_y },
      z = { fg = colors.fg_b_y },
    },

    insert = {
      a = { fg = colors.fg_a_z, bg = colors.insert },
      z = { fg = colors.fg_b_y }
    },
    visual = {
      a = { fg = colors.fg_a_z, bg = colors.visual },
      z = { fg = colors.fg_b_y }
    },
    replace = {
      a = { fg = colors.fg_a_z },
      z = { fg = colors.fg_b_y }
    },

    inactive = {
      a = { fg = colors.fg_b_y },
      b = { fg = colors.fg_b_y },
      c = { fg = colors.fg_a_z },
    },
  }
end

local linelua = vim.get_plugin("lualine")
if not linelua then return end

return function(colors)
  return linelua.setup {
    options = {
      icons_enabled = true,
      theme = minimal_theme(colors),
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { 'mode', fmt = function(str)
          if str == "NORMAL" then
            return "󰝆" --󰎖
          end
          if str == "V-LINE" then
            return "" --   
          end
          if str == "INSERT" then
            return "" -- 󰬐 
          end

          return str:sub(1, 1)
        end }, -- right = ' '
      },
      lualine_b = {
        { 'branch', icon = { '', align = 'right' }, color = { fg = colors.fg_b_y } },
        { 'filetype', icon_only = true },
      },
      lualine_c = {
        {
          'diagnostics',
          source = { 'nvim' },
          sections = { 'error', 'warn' },
          diagnostics_color = {
            error = { fg = colors.red },
            warn = { fg = colors.yellow }
          },
        },
      },
      lualine_x = { { 'fileformat', color = { fg = colors.blue } } },
      lualine_y = {},
      lualine_z = {
        { 'progress', color = { fg = colors.orange } },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {
      'toggleterm',
      'nvim-tree',
      'mason',
      'fzf'
    },
  }
end
