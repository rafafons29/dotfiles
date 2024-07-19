local autopairs = noty.get_plugin("nvim-autopairs")
if not autopairs then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})
