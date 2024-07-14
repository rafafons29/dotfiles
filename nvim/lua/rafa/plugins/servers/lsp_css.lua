return {
  filetypes = { "css", "scss", "less", "qss" },
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
      workspace = {
        library = require("rafa.plugins.servers.lsp_functions").loadfolder(),
        checkThirdParty = false,
      },
    },
    scss = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
}
