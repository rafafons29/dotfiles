return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim', 'nvim-telescope/telescope-media-files.nvim' },
  opts = {
    defaults = {
      mappings = {
        n = {
          ["q"] = require('telescope.actions').close
        },
      },
    },
    extensions = {
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg" },
        find_cmd = "rg"
      },
      file_browser = {
        theme = "dropdown",
        hijack_netrw = true,
        mappings = {
          i = {
            ["<C-w>"] = function() vim.cmd('normal vbd') end,
          },
          n = {
            ["a"] = require('telescope').extensions.file_browser.actions.create,
            ["h"] = require('telescope').extensions.file_browser.actions.goto_parent_dir,
            ["/"] = function()
              vim.cmd('startinsert')
            end
          },
        },
      },
    },
  },
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)

    telescope.load_extension("file_browser")
    telescope.load_extension("media_files")
    telescope.load_extension("noice")

    vim.telescope_buffer_dir = function()
      return vim.fn.expand('%:p:h')
    end

    -- local keymap = require('lazy').keymap

    -- keymap.set('n', ';f', function()
    --   require('telescope.builtin').find_files({
    --     no_ignore = true,
    --     hidden = true
    --   })
    -- end)

    -- keymap.set('n', ';r', function() require('telescope.builtin').live_grep() end)
    -- keymap.set('n', '\\\\', function() require('telescope.builtin').buffers() end)
    -- keymap.set('n', ';t', function() require('telescope.builtin').help_tags() end)
    -- keymap.set('n', ';;', function() require('telescope.builtin').resume() end)
    -- keymap.set('n', ';e', function() require('telescope.builtin').diagnostics() end)
    -- keymap.set('n', ';s', function() require('telescope.builtin').current_buffer_fuzzy_find() end)
    --
    -- keymap.set('n', 'sf', function()
    --   require('telescope').extensions.file_browser.file_browser({
    --     path = "%:p:h",
    --     cwd = vim.telescope_buffer_dir(),
    --     respect_gitignore = false,
    --     hidden = true,
    --     grouped = true,
    --     previewer = false,
    --     initial_mode = "normal",
    --     layout_config = { height = 20 }
    --   })
    -- end)
    --
    -- keymap.set('n', 'ff', '<cmd>FZF<cr>', { desc = "Search and open files using fzf" })
    -- keymap.set('n', 'fzf', '<cmd>FZF!<cr>', { desc = "Search and open files using fzf" })
  end
}
