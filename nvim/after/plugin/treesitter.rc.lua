local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  auto_install = false,
  ignore_install = {},
  modules = {},

  -- A list of parser names, or "all"
  ensure_installed = {
    "fish",
    "json",
    "lua",
    "cpp",
    "c",
    "python",
    "go"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "html" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- vim.treesitter.language.add('html', { path = "/path/to/python.so" })
