local telescope = vim.get_plugin("telescope")
local actions = vim.get_plugin("telescope.actions")
local builtin = vim.get_plugin("telescope.builtin")

if not telescope then return end
if not actions then return end
if not builtin then return end

vim.telescope = telescope
vim.builtin = builtin


local fb_actions = require "telescope".extensions.file_browser.actions

telescope.load_extension("noice")
telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    },
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["a"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },

  },
}

telescope.load_extension("file_browser")
telescope.load_extension("media_files")
