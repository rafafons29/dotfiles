return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = require("rafa.plugins.servers.lsp_functions").loadfolder(),
        checkThirdParty = false,
      },
    },
  },
}
