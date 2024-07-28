return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
    },
    build        = ':TSUpdate',
    event        = 'VeryLazy',
    main         = "config.plugins.treesitter",
    config       = true
  },
  {
    'romgrk/nvim-treesitter-context',
    event = 'BufRead',
    main = "config.plugins.ts_context",
    config = true
  },
}
