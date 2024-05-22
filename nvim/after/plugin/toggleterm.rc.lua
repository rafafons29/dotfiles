local status, term = pcall(require, "toggleterm")
if not status then return end

term.setup {
  size = 70,
  open_mapping = [[<c-g>]], -- ctrl + / = New terminal
  direction = 'vertical',
  shell = 'fish',
}
