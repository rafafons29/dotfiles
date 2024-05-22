return {
  filetypes = { "html" },
  -- cmd = { "vscode-html-language-server.cmd", "--stdio" },
  -- Disable builtin formatter
  init_options = {
    provideFormatter = "Prettier",
  },
}
