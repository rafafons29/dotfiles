local function bubbles_theme(colors)
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

local status, linelua = pcall(require, "lualine")
if not status then return end

return function(colors)
  return linelua.setup {
    options = {
      theme = bubbles_theme(colors),
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '', right = '' }, right_padding = 0 },
      },
      lualine_b = { 'filename', 'branch' },
      lualine_c = {},
      lualine_x = { 'fileformat' },
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { left = '', right = '' }, left_padding = 0 },
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
