local nvim_lsp = vim.get_plugin("lspconfig")
if not nvim_lsp then return end

local lspf = require("rafa.plugins.servers.lsp_functions")

local luasnip = vim.get_plugin("luasnip")
if not luasnip then return end
_G.luasnip = luasnip

-- Icons
local protocol = require('vim.lsp.protocol')
protocol.CompletionItemKind = lspf.protocolCompletionItemKind

-- ----------------Conf to servers lsp---------------- --

-- Lua
local lsp_lua = require("rafa.plugins.servers.lsp_lua")
nvim_lsp.lua_ls.setup {
  on_attach = function(client, bufnr)
    lspf.on_attach(client, bufnr)
    lspf.enable_format_on_save(client, bufnr)
  end,
  settings = lsp_lua.settings,
}

-- Goland config
local lsp_go = require("rafa.plugins.servers.lsp_go")
nvim_lsp.gopls.setup {
  on_attach = lspf.on_attach,
  capabilities = lspf.capabilities,
  cmd = lsp_go.cmd,
  filetypes = lsp_go.filetypes,
  root_dir = lsp_go.root_dir,
  settings = lsp_go.settings
}

-- Python server lsp
local lsp_py = require("rafa.plugins.servers.lsp_pyright")
nvim_lsp.pyright.setup {
  on_attach = lspf.on_attach,
  capabilities = lspf.capabilities,
  settings = lsp_py.settings,
}

-- C/C++ server lsp
local lsp_c = require("rafa.plugins.servers.lsp_clangd")
nvim_lsp.clangd.setup {
  on_attach = lspf.on_attach,
  capabilities = lspf.capabilities,
  cmd = lsp_c.cmd,
}

-- Cmake Language Server
local lsp_cmk = require("rafa.plugins.servers.lsp_cmake")
nvim_lsp.cmake.setup {
  on_attach = lspf.on_attach,
  capabilities = lspf.capabilities,
  cmd = lsp_cmk.cmd,
  filetypes = lsp_cmk.filetypes,
}

-- C# language server
local lsp_cssharp = require("rafa.plugins.servers.lsp_cssharp")
nvim_lsp.csharp_ls.setup {
  on_attach = lspf.on_attach,
  capabilities = lspf.capabilities,
  cmd = lsp_cssharp.cmd
}

-- Asm-lsp
local lsp_asm = require("rafa.plugins.servers.lsp_asm")
nvim_lsp.asm_lsp.setup {
  on_attach = lspf.on_attach,
  capabilities = lspf.capabilities,
  filetypes = lsp_asm.filetypes,
  cmd = lsp_asm.cmd,
  root_dir = lsp_asm.root_dir
}

-- Typescript and javascript
local lsp_tss = require("rafa.plugins.servers.lsp_tsserver")
nvim_lsp.tsserver.setup {
  on_attach = lspf.on_attach,
  capabilities = lspf.capabilities,
  filetypes = lsp_tss.filetypes,
  cmd = lsp_tss.cmd,
  settings = lsp_tss.settings,
}

-- HTML
local lsp_html = require("rafa.plugins.servers.lsp_html")
nvim_lsp.html.setup {
  on_attach = lspf.on_attach,
  capabilities = lspf.capabilities,
  filetypes = lsp_html.filetypes,
  cmd = lsp_html.cmd,
  init_options = lsp_html.init_options
}

-- CSS
local lsp_css = require("rafa.plugins.servers.lsp_css")
nvim_lsp.cssls.setup {
  on_attach = lspf.on_attach,
  filetypes = lsp_css.filetypes,
  capabilities = lspf.capabilities,
  settings = lsp_css.settings
}

local lsp_esl = require("rafa.plugins.servers.lsp_eslint")
nvim_lsp.eslint.setup {
  on_attach = lspf.on_attach,
  capabilities = lspf.capabilities,
  settings = lsp_esl.settings,
}

-- nvim_lsp.flow.setup {
--   capabilities = lspf.on_attach,
--   on_attach = lspf.on_attach,
-- }
--
-- nvim_lsp.sourcekit.setup {
--   capabilities = lspf.on_attach,
--   on_attach = lspf.on_attach,
-- }


-- local tlwcss = require("rafa.plugins.servers.lsp_tailwindcss")
-- nvim_lsp.tailwindcss.setup {
--   capabilities = lspf.on_attach,
--   on_attach = lspf.on_attach,
--   filetypes = tlwcss.filetypes,
--   init_options = tlwcss.init_options,
--   settings = tlwcss.settings,
-- }
--
--
-- nvim_lsp.astro.setup {
--   capabilities = lspf.on_attach,
--   on_attach = lspf.on_attach,
-- }


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = false,
    severity_sort = true,
  }
)

-- Diagnostic symbols in the sign column (gutter)
for type, icon in pairs(lspf.signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
