vim.g.db_ui_use_nerd_fonts = 1
vim.g.dbs = {
  {
    { name = 'dev',     url = 'postgres://postgres:mypassword@localhost:5432/my-dev-db' },
    { name = 'staging', url = 'postgres://postgres:mypassword@localhost:5432/my-staging-db' },
    { name = 'wp',      url = 'mysql://root@localhost/wp_awesome' },
    {
      name = 'production',
      url = function()
        return vim.fn.system('get-prod-url')
      end
    },
  }
}
