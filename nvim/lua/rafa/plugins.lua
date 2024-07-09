local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -------------------- Themes --------------------
  use 'ghifarit53/tokyonight-vim'
  use 'alexmozaidze/palenight.nvim'
  use 'navarasu/onedark.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'nyoom-engineering/oxocarbon.nvim'
  use {
    "nobbmaestro/nvim-andromeda",
    requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
  }
  ------------------------------------------------

  ------------------- Utilities -------------------
  use 'nvim-lualine/lualine.nvim'    -- Statusline
  use 'akinsho/nvim-bufferline.lua'  -- Diferent buffers
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-lua/plenary.nvim'        -- Common utilities
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/zen-mode.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'          -- For git blame & browse
  use 'Djancyp/better-comments.nvim' -- Better comments for nvim
  use 'lukas-reineke/indent-blankline.nvim'
  use 'RRethy/vim-illuminate'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'brenton-leighton/multiple-cursors.nvim'
  use 'rcarriga/nvim-notify'
  use 'MunifTanjim/nui.nvim'
  use 'folke/noice.nvim'
  use 'sindrets/diffview.nvim'
  use 'stevearc/dressing.nvim'
  use 'ziontee113/icon-picker.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use "b0o/incline.nvim"

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    "WilsonOh/emoji_picker-nvim",
    config = function()
      require("emoji_picker").setup()
    end,
  }

  use {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function() require('dashboard').setup {} end,
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }
  use { 'akinsho/toggleterm.nvim', version = "*", config = true }
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use { 'nvim-treesitter/nvim-treesitter', }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  }
  use {
    'p00f/nvim-ts-rainbow',
    requires = 'nvim-treesitter/nvim-treesitter'
  }

  use {
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
  }

  -- use {
  --   "smjonas/inc-rename.nvim",
  --   config = function()
  --     require("inc_rename").setup()
  --   end,
  -- }

  -- Animations
  use { 'echasnovski/mini.nvim', version = '*' }
  use { 'echasnovski/mini.indentscope', version = '*' }
  use { 'echasnovski/mini.animate', version = '*' }
  -------------------------------------------------

  ------------------- Utilities For languages -------------------
  -- C/C++
  use 'Civitasv/cmake-tools.nvim'
  use {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }

  -- Flutter
  -- {
  --   'akinsho/flutter-tools.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'stevearc/dressing.nvim', -- optional for vim.ui.select
  --   },
  -- };

  -- Markdown
  use 'iamcco/markdown-preview.nvim'
  use 'arminveres/md-pdf.nvim'

  -- go
  use 'leoluz/nvim-dap-go'
  use 'olexsmir/gopher.nvim'

  ---------------------------------------------------------------

  ---------------------- LSP ----------------------
  use 'onsails/lspkind-nvim'            -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                -- Completion
  use 'neovim/nvim-lspconfig'           -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'folke/lsp-colors.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip'
  -------------------------------------------------
end)
