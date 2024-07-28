return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = require("servers.lsp_functions").loadfolder(),
        checkThirdParty = false,
      },
    },
  },
}
