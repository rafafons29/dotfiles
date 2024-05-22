require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "storm",  -- The theme is used when the background is set to light
  transparent = false,    -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "night",             -- style for sidebars, see below
    floats = "night",               -- style for floating windows
  },
  sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false,             -- dims inactive windows
  lualine_bold = true,              -- When `true`, section headers in the lualine theme will be bold

  on_colors = function(colors) end,

  on_highlights = function(highlights, colors) end,
})

vim.cmd("colorscheme tokyonight")
local colors = require("rafa.colors.colors_tokyonight")
require("rafa.plugin.lualine.lualine")(colors)
require("rafa.plugin.bufferline.bufferline")(colors)
