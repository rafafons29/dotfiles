local function minimal_theme(colors)
  return {
    normal = {
      a = { fg = colors.fg_a_z, bg = colors.normal },
      b = { fg = colors.fg_b_y, bg = colors.bg_b_y },
      c = { fg = colors.insert, bg = nil },
    },

    insert = { a = { fg = colors.fg_a_z, bg = colors.insert } },
    visual = { a = { fg = colors.fg_a_z, bg = colors.visual } },
    replace = { a = { fg = colors.fg_a_z } },

    inactive = {
      a = { fg = colors.fg_b_y, bg = nil },
      b = { fg = colors.fg_b_y, bg = nil },
      c = { fg = colors.fg_a_z, bg = nil },
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
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { right = '' }, right_padding = 0 },
      },
      lualine_b = { 'branch', 'filetype' },
      lualine_c = {
        'filename',
        {
          'diagnostics',
          source = { 'nvim' },
          sections = { 'error', 'warn' },
          diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
        },
      },
      lualine_x = { 'fileformat' },
      lualine_y = { 'progress' },
      lualine_z = {
        { 'location', separator = { left = '' }, left_padding = 0 },
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
    extensions = {},
  }
end
