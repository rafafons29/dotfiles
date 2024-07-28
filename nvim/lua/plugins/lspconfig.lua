local servers = require("servers.servers")
local lspf = require("servers.lsp_functions")
local nvim_lsp = require("lspconfig")

return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/nvim-compe', 'L3MON4D3/LuaSnip' }, -- Asumiendo que usas compe y LuaSnip
  opts = {},                                                   -- Deja esto vacío ya que la configuración está en otros archivos
  config = function()
    local function setup_autocmd(filetype, setup_func)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetype,
        callback = setup_func,
      })
    end

    setup_autocmd('lua', servers.lua)
    setup_autocmd('go', servers.go)
    setup_autocmd('python', servers.py)
    setup_autocmd({ 'c', 'cpp' }, servers.clangd)
    setup_autocmd('cmake', servers.cmake)
    setup_autocmd({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }, servers.tss)
    setup_autocmd({ 'html', 'markdown' }, servers.html)
    setup_autocmd({ 'css', 'qss' }, servers.css)
    setup_autocmd({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }, servers.eslint)


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

    vim.keymap.set('n', '<leader>lv', function()
      nvim_lsp.lua_ls.setup {
        on_attach = function(client, bufnr)
          lspf.on_attach(client, bufnr)
          lspf.enable_format_on_save(client, bufnr)
        end,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = lspf.loadfolder(true),
              checkThirdParty = false,
            },
          },
        },
      }
      vim.cmd('LspStop lua_ls')
      vim.cmd('LspStart lua_ls')
      vim.notify('Vim modules are avaible')
    end, { desc = "Load vim modules for work with them" })
  end
}
