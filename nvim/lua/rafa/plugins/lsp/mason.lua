local mason = noty.get_plugin("mason")
local lspconfig = noty.get_plugin("mason-lspconfig")

if not mason then return end
if not lspconfig then return end

mason.setup({
  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
})

lspconfig.setup {
  automatic_installation = true
}

keymap.set('n', '<leader>cm', '<cmd>Mason<cr>')
