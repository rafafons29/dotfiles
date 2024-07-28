return {
  "ziontee113/icon-picker.nvim",
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })
  end,
  keys = {
    { '<Leader><Leader>i', '<cmd>IconPickerNormal<cr>', mode = 'n' },
    { '<Leader><Leader>y', '<cmd>IconPickerYank<cr>',   mode = 'n' },
    { '<C-i>',             '<cmd>IconPickerInsert<cr>', mode = 'i' }
  }
}
