local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add {
  -------------------- Themes --------------------
  'ghifarit53/tokyonight-vim',
  'alexmozaidze/palenight.nvim',
  'navarasu/onedark.nvim',
  { "catppuccin/nvim",         as = "catppuccin" },
  'nyoom-engineering/oxocarbon.nvim',
  {
    "nobbmaestro/nvim-andromeda",
    requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
  },
  ------------------------------------------------

  ------------------- Utilities -------------------
  'nvim-lualine/lualine.nvim',    -- Statusline
  'akinsho/nvim-bufferline.lua',  -- Diferent buffers
  'kyazdani42/nvim-web-devicons', -- File icons
  'nvim-lua/plenary.nvim',        -- Common utilities
  'nvim-lua/popup.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-media-files.nvim',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'norcalli/nvim-colorizer.lua',
  'folke/zen-mode.nvim',
  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim',          -- For git blame & browse
  'Djancyp/better-comments.nvim', -- Better comments for nvim
  'lukas-reineke/indent-blankline.nvim',
  'RRethy/vim-illuminate',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',
  'brenton-leighton/multiple-cursors.nvim',
  'rcarriga/nvim-notify',
  'MunifTanjim/nui.nvim',
  'folke/noice.nvim',
  'sindrets/diffview.nvim',
  'stevearc/dressing.nvim',

  {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true
      })
    end,
  },

  {
    "WilsonOh/emoji_picker-nvim",
    config = function()
      require("emoji_picker").setup()
    end,
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
    end,
    requires = { 'nvim-tree/nvim-web-devicons' }
  },

  {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  },
  { 'akinsho/toggleterm.nvim', version = "*",    config = true },
  { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  },
  { 'nvim-treesitter/nvim-treesitter', },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    'p00f/nvim-ts-rainbow',
    requires = 'nvim-treesitter/nvim-treesitter'
  },

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  -- Animations
  { 'echasnovski/mini.nvim',           version = '*' },
  { 'echasnovski/mini.indentscope',    version = '*' },
  { 'echasnovski/mini.animate',        version = '*' },
  -------------------------------------------------

  ------------------- Utilities For languages -------------------
  -- C/C++
  'Civitasv/cmake-tools.nvim',
  {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  },
  { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

  -- Flutter
  -- {
  --   'akinsho/flutter-tools.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'stevearc/dressing.nvim', -- optional for vim.ui.select
  --   },
  -- };

  -- Markdown
  'iamcco/markdown-preview.nvim',
  'arminveres/md-pdf.nvim',

  -- go
  'leoluz/nvim-dap-go',
  'olexsmir/gopher.nvim',

  ---------------------------------------------------------------

  ---------------------- LSP ----------------------
  'onsails/lspkind-nvim',            -- vscode-like pictograms
  'hrsh7th/cmp-buffer',              -- nvim-cmp source for buffer words
  'hrsh7th/cmp-nvim-lsp',            -- nvim-cmp source for neovim's built-in LSP
  'hrsh7th/nvim-cmp',                -- Completion
  'neovim/nvim-lspconfig',           -- LSP
  'jose-elias-alvarez/null-ls.nvim', -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  'folke/lsp-colors.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'glepnir/lspsaga.nvim', -- LSP UIs
  'L3MON4D3/LuaSnip',
  -------------------------------------------------
}
