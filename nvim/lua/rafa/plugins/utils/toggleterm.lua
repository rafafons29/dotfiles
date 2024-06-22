local term = vim.get_plugin("toggleterm")
if not term then return end

term.setup({
  size = 70,
  open_mapping = [[<c-g>]], -- ctrl + / = New terminal
  direction = 'vertical',
  shell = 'fish',
})
