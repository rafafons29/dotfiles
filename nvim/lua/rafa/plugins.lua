local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -------------------- Themes --------------------
  -- use 'ghifarit53/tokyonight-vim'
  use 'folke/tokyonight.nvim'
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
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  use "Djancyp/better-comments.nvim"
  use 'RRethy/vim-illuminate'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'rcarriga/nvim-notify'
  use 'MunifTanjim/nui.nvim'
  use 'folke/noice.nvim'
  use 'sindrets/diffview.nvim'
  use 'stevearc/dressing.nvim'
  use 'ziontee113/icon-picker.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'b0o/incline.nvim'
  use 'folke/flash.nvim'
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { "danymat/neogen" }

  use { "WilsonOh/emoji_picker-nvim" }

  use {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
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
      require("which-key").setup {}
    end
  }

  use { "smjonas/inc-rename.nvim" }

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

  -- Markdown
  use 'iamcco/markdown-preview.nvim'
  use 'arminveres/md-pdf.nvim'
  use 'HakonHarnes/img-clip.nvim'
  use({
    "tadmccorkle/markdown.nvim",
    config = function()
      require("markdown").setup({
        -- configuration here or empty for defaults
      })
    end,
  })
  use({
    'MeanderingProgrammer/markdown.nvim',
    as = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    after = { 'nvim-treesitter' },
    requires = { 'echasnovski/mini.nvim', opt = true },
    config = function()
      require('render-markdown').setup({})
    end,
  })

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
