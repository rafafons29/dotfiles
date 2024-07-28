return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead', -- Se carga al abrir un bufferm
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = function()
      local ts = require('nvim-treesitter.configs')
      
      return {
        auto_install = false,
        ignore_install = {},
        modules = {},

        ensure_installed = {
          "fish",
          "json",
          "lua",
          "cpp",
          "c",
          "python",
          "go",
          "html",
          "markdown"
        },

        sync_install = false,

        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
          }
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
          colors = {
            '#00e8c6', -- cyan
            '#42be65', -- green
            '#FC644D', -- red
            '#9040C4', -- violet
            '#00b0ff', -- blue
            '#FFE66D', -- yellow
            '#FF855B', -- orange
          },
        }
      }
    end,
  },

  -- Configuración para treesitter-context
  {
    'romgrk/nvim-treesitter-context',
    event = 'BufRead',
    opts = function()
      local ts_context = require('treesitter-context')
      
      return {
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = 'outer',
        separator = nil,
        zindex = 20,
        on_attach = nil,
      }
    end,
  },
}
