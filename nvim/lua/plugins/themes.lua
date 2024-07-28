-- plugins/tokyonight.lua
return {
  {
    'folke/tokyonight.nvim',
    main = 'config.plugins.tokyonight',
    config = true,
  },
  {
    'navarasu/onedark.nvim',
    main = 'config.plugins.onedark',
    config = true
  },
  {
    "nobbmaestro/nvim-andromeda",
    dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" },
    main = 'config.plugins.andromeda',
    config = true
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    main = 'config.plugins.oxocarbon',
    config = true
  },
}
