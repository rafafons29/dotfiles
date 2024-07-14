return {
  filetypes = { "html" },
  -- cmd = { "vscode-html-language-server.cmd", "--stdio" },
  -- Disable builtin formatter
  init_options = {
    provideFormatter = "Prettier",
  },
  settings = {
    html = {
      -- workspace = {
      --   library = require("rafa.plugins.servers.lsp_functions").loadfolder(),
      --   checkThirdParty = false,
      -- },
    }
  }
}
