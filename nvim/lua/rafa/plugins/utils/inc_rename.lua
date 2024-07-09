local inc_rename = vim.get_plugin('inc_rename')
if not inc_rename then return end

inc_rename.setup {
  presets = { inc_rename = true },
  -- the name of the command
  cmd_name = "IncRename",
  -- the highlight group used for highlighting the identifier's new name
  hl_group = "Substitute",
  -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
  preview_empty_name = false,
  -- whether to display a `Renamed m instances in n files` message after a rename operation
  show_message = true,
  -- whether to save the "IncRename" command in the commandline history (set to false to prevent issues with
  -- navigating to older entries that may arise due to the behavior of command preview)
  save_in_cmdline_history = true,
  -- the type of the external input buffer to use (the only supported value is currently "dressing")
  input_buffer_type = nil,
  -- callback to run after renaming, receives the result table (from LSP handler) as an argument
  post_hook = nil,
}
