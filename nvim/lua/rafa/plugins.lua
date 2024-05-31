local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -------------------- Themes --------------------
  use 'navarasu/onedark.nvim'
  use 'drewtempelmeyer/palenight.vim'
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'nyoom-engineering/oxocarbon.nvim' }
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
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/zen-mode.nvim'
  use 'tpope/vim-surround'           --*
  use 'wellle/targets.vim'           --*
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'          -- For git blame & browse
  use "Djancyp/better-comments.nvim" -- Better comments for nvim
  use "lukas-reineke/indent-blankline.nvim"
  use 'RRethy/vim-illuminate'

  use { -- Exolorer
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use { 'nvim-treesitter/nvim-treesitter', }
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use {
    'p00f/nvim-ts-rainbow',
    requires = 'nvim-treesitter/nvim-treesitter'
  }

  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })
  -------------------------------------------------

  ------------------- Utilities For languages -------------------
  -- C/C++
  use 'Civitasv/cmake-tools.nvim'

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = {
        "markdown" }
    end,
    ft = { "markdown" },
  })
  ---------------------------------------------------------------

  ---------------------- LSP ----------------------
  use 'onsails/lspkind-nvim'            -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                -- Completion
  use 'neovim/nvim-lspconfig'           -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip'
  -------------------------------------------------
end)
