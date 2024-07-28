return {
  'lewis6991/gitsigns.nvim',
  cond = function()
    return vim.fn.system("git rev-parse --is-inside-work-tree") == "true\n"
  end,
  opts = {
    signs = {
      add          = { text = '▏' },
      change       = { text = '▏' },
      delete       = { text = '▏' },
      topdelete    = { text = '▏' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged = {
      add          = { text = '▏' },
      change       = { text = '▏' },
      delete       = { text = '▏' },
      topdelete    = { text = '▏' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signcolumn = false,
    numhl = true,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
      follow_files = true
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
  },
  key = {
    -- Define mappings if needed
  }
}
