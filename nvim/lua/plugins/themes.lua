local function set_colorscheme(theme_name)
  local lethm = {
    tokyonight = true,
    onedark = true,
    andromeda = true,
    oxocarbon = true,
  }

  lethm[theme_name] = false

  return lethm
end

_G.theme_name = 'onedark'
local theme = set_colorscheme(theme_name)

return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = theme.tokyonight,
    main = 'config.plugins.tokyonight',
    config = true,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = theme.onedark,
    main = 'config.plugins.onedark',
    config = true
  },
  {
    "nobbmaestro/nvim-andromeda",
    priority = 1000,
    lazy = theme.andromeda,
    dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" },
    main = 'config.plugins.andromeda',
    config = true
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
    lazy = theme.oxocarbon,
    main = 'config.plugins.oxocarbon',
    config = true
  },
  {
    'sainnhe/sonokai',
    lazy = true,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
      -- vim.cmd.colorscheme('sonokai')
    end
  }
}
