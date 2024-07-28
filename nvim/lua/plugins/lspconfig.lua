local servers = require("servers.servers")

return {
  {
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
    end
  },
  {
    'jose-elias-alvarez/null-ls.nvim', -- ESLint y otros linters/formatters
    opts = {
      sources = {
        require('null-ls').builtins.diagnostics.eslint,
        require('null-ls').builtins.formatting.prettier
      }
    },
    config = function(_, opts)
      require('null-ls').setup(opts)
    end
  }
}
