local icons = noty.get_plugin("nvim-web-devicons")
if not icons then return end

icons.setup {
  override = {
  },
  default = true
}
