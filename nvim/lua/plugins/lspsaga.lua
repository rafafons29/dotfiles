return {
  'glepnir/lspsaga.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-tree/nvim-web-devicons' },
  opts = {
    ui = {
      border = 'rounded',
    },
    symbol_in_winbar = {
      enable = false
    },
    lightbulb = {
      enable = false
    },
    outline = {
      layout = 'float'
    }
  },
  keys = {
    { 'n',          '<C-j>',      '<Cmd>Lspsaga diagnostic_jump_next<CR>',     { noremap = true, silent = true } },
    { 'n',          'gl',         '<Cmd>Lspsaga show_line_diagnostics<CR>',    { noremap = true, silent = true } },
    { 'n',          'K',          '<Cmd>Lspsaga hover_doc<CR>',                { noremap = true, silent = true } },
    { 'n',          'gd',         '<Cmd>Lspsaga finder<CR>',                   { noremap = true, silent = true } },
    { 'n',          'gt',         '<Cmd>Lspsaga goto_type_definition<CR>',     { noremap = true, silent = true } },
    { 'i',          '<C-k>',      '<Cmd>Lspsaga signature_help<CR>',           { noremap = true, silent = true } },
    { 'i',          '<C-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true } },
    { 'n',          'gp',         '<Cmd>Lspsaga peek_definition<CR>',          { noremap = true, silent = true } },
    { 'n',          'gr',         '<Cmd>Lspsaga rename<CR>',                   { noremap = true, silent = true } },
  },
  config = function(_, opts)
    require('lspsaga').setup(opts)
  end,
}
