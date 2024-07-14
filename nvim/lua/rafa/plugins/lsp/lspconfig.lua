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
local function setup_lua()
  local lsp_lua = require("rafa.plugins.servers.lsp_lua")
  nvim_lsp.lua_ls.setup {
    on_attach = function(client, bufnr)
      lspf.on_attach(client, bufnr)
      lspf.enable_format_on_save(client, bufnr)
    end,
    settings = lsp_lua.settings,
  }
  vim.cmd('LspStart lua_ls')
end

-- Goland config
local function setup_go()
  local lsp_go = require("rafa.plugins.servers.lsp_go")
  nvim_lsp.gopls.setup {
    on_attach = lspf.on_attach,
    capabilities = lspf.capabilities,
    cmd = lsp_go.cmd,
    filetypes = lsp_go.filetypes,
    root_dir = lsp_go.root_dir,
    settings = lsp_go.settings
  }
  vim.cmd('LspStart gopls')
end

-- Python server lsp
local function setup_py()
  local lsp_py = require("rafa.plugins.servers.lsp_pyright")
  nvim_lsp.pyright.setup {
    on_attach = lspf.on_attach,
    capabilities = lspf.capabilities,
    settings = lsp_py.settings,
  }
  vim.cmd('LspStart pyright')
end

-- C/C++ server lsp
local function setup_clangd()
  local lsp_c = require("rafa.plugins.servers.lsp_clangd")
  nvim_lsp.clangd.setup {
    on_attach = lspf.on_attach,
    capabilities = lspf.capabilities,
    cmd = lsp_c.cmd,
  }
  vim.cmd('LspStart clangd')
end

-- Cmake Language Server
local function setup_cmake()
  local lsp_cmk = require("rafa.plugins.servers.lsp_cmake")
  nvim_lsp.cmake.setup {
    on_attach = lspf.on_attach,
    capabilities = lspf.capabilities,
    cmd = lsp_cmk.cmd,
    filetypes = lsp_cmk.filetypes,
  }
  vim.cmd('LspStart cmake')
end

-- C# language server
local function setup_cssharp()
  local lsp_cssharp = require("rafa.plugins.servers.lsp_cssharp")
  nvim_lsp.csharp_ls.setup {
    on_attach = lspf.on_attach,
    capabilities = lspf.capabilities,
    cmd = lsp_cssharp.cmd
  }
  vim.cmd('LspStart omnisharp')
end

-- Asm-lsp
local function setup_asm()
  local lsp_asm = require("rafa.plugins.servers.lsp_asm")
  nvim_lsp.asm_lsp.setup {
    on_attach = lspf.on_attach,
    capabilities = lspf.capabilities,
    filetypes = lsp_asm.filetypes,
    cmd = lsp_asm.cmd,
    root_dir = lsp_asm.root_dir
  }
  vim.cmd('LspStart asm_lsp')
end

-- Typescript and javascript
local function setup_tss()
  local lsp_tss = require("rafa.plugins.servers.lsp_tsserver")
  nvim_lsp.tsserver.setup {
    on_attach = lspf.on_attach,
    capabilities = lspf.capabilities,
    filetypes = lsp_tss.filetypes,
    cmd = lsp_tss.cmd,
    settings = lsp_tss.settings,
  }
  vim.cmd('LspStart tss')
end

-- HTML
local function setup_html()
  local lsp_html = require("rafa.plugins.servers.lsp_html")
  nvim_lsp.html.setup {
    on_attach = lspf.on_attach,
    capabilities = lspf.capabilities,
    filetypes = lsp_html.filetypes,
    cmd = lsp_html.cmd,
    init_options = lsp_html.init_options
  }
  vim.cmd('LspStart html')
end

-- CSS
local function setup_css()
  local lsp_css = require("rafa.plugins.servers.lsp_css")
  nvim_lsp.cssls.setup {
    on_attach = lspf.on_attach,
    filetypes = lsp_css.filetypes,
    capabilities = lspf.capabilities,
    settings = lsp_css.settings
  }
  vim.cmd('LspStart cssls')
end

local lsp_esl = require("rafa.plugins.servers.lsp_eslint")
nvim_lsp.eslint.setup {
  on_attach = lspf.on_attach,
  capabilities = lspf.capabilities,
  settings = lsp_esl.settings,
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = setup_lua
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = 'go',
  callback = setup_go
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = 'python',
  callback = setup_py
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { 'c', 'cpp' },
  callback = setup_clangd
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = 'cmake',
  callback = setup_cmake
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = 'cs',
  callback = setup_cssharp
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = 'asm',
  callback = setup_asm
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  callback = setup_tss
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = 'html',
  callback = setup_html
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = 'css',
  callback = setup_css
})
----------------------------------------------------------------------


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
