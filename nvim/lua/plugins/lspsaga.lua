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
    { '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>',     mode = 'n' },
    { 'gl',    '<Cmd>Lspsaga show_line_diagnostics<CR>',    mode = 'n' },
    { 'K',     '<Cmd>Lspsaga hover_doc<CR>',                mode = 'n' },
    { 'gd',    '<Cmd>Lspsaga finder<CR>',                   mode = 'n' },
    { 'gt',    '<Cmd>Lspsaga goto_type_definition<CR>',     mode = 'n' },
    { '<C-k>', '<Cmd>Lspsaga signature_help<CR>',           mode = 'i' },
    { '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', mode = 'i' },
    { 'gp',    '<Cmd>Lspsaga peek_definition<CR>',          mode = 'n' },
    { 'gr',    '<Cmd>Lspsaga rename<CR>',                   mode = 'n' },
  },
  config = function(_, opts)
    require('lspsaga').setup(opts)
  end,
}
