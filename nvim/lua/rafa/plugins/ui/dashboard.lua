-- local db = vim.get_plugin('dashboard')
-- if not db then return end
--
-- dashboard.preview_file_height = 11
-- dashboard.preview_file_width = 70
-- dashboard.default_banner = {
--   '██████╗  █████╗ ███████╗ █████╗',
--   '██╔══██╗██╔══██╗██╔════╝██╔══██╗',
--   '██████╔╝███████║█████╗  ███████║',
--   '██╔══██╗██╔══██║██╔══╝  ██╔══██║',
--   '██║  ██║██║  ██║██║     ██║  ██║',
--   '╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝'
-- }
--
-- dashboard.custom_center = {
--   { icon = '  ', desc = 'Recently opened files', action = 'Telescope oldfiles', key = 'r' },
--   { icon = '  ', desc = 'Find File          ', action = 'Telescope find_files', key = 'f' },
--   { icon = '  ', desc = 'Open last session  ', action = 'SessionLoad', key = 'l' },
--   { icon = '  ', desc = 'New File           ', action = 'DashboardNewFile', key = 'n' },
--   { icon = '  ', desc = 'Configuration      ', action = 'edit $MYVIMRC', key = 'c' },
--   { icon = '  ', desc = 'Exit               ', action = 'exit', key = 'q' },
-- }

-- db.setup({
--   theme = 'doom',
--   config = {
--     header = {
--       '██████╗  █████╗ ███████╗ █████╗',
--       '██╔══██╗██╔══██╗██╔════╝██╔══██╗',
--       '██████╔╝███████║█████╗  ███████║',
--       '██╔══██╗██╔══██║██╔══╝  ██╔══██║',
--       '██║  ██║██║  ██║██║     ██║  ██║',
--       '╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝'
--     },
--     center = {
--       {
--         icon = ' ',
--         icon_hl = 'Title',
--         desc = 'Find File           ',
--         desc_hl = 'String',
--         key = 'b',
--         keymap = 'SPC f f',
--         key_hl = 'Number',
--         key_format = ' %s', -- remove default surrounding `[]`
--         action = 'lua print(2)'
--       },
--       {
--         icon = ' ',
--         desc = 'Find Dotfiles',
--         key = 'f',
--         keymap = 'SPC f d',
--         key_format = ' %s', -- remove default surrounding `[]`
--         action = 'lua print(3)'
--       },
--     },
--     footer = {} --your footer
--   }
-- })

local db = require('dashboard')
db.preview_file_height = 11
db.preview_file_width = 70
db.default_banner = {
  '',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
  ' [ -- Wellcome ShashinV --] ',
  '',
}
db.custom_center = {
  {
    icon = '  ',
    desc = 'New File                          ',
    action = 'DashboardNewFile',
    shortcut = 'Leader n f'
  },
  {
    icon = '🔍 ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'f w'
  },
  {
    icon = '🔍 ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'f f'
  },
  {
    icon = '⌚️ ',
    desc = 'Recently opened files                   ',
    action = 'Telescope oldfiles',
    shortcut = 'f h'
  },
  {
    icon = '🔖  ',
    desc = 'Bookmarks                               ',
    action = 'BookmarkShowAll',
    shortcut = 'b a'
  },
  {
    icon = '  ',
    desc = 'File Browser                             ',
    action = 'Telescope file_browser',
    shortcut = 'f b'
  },
  {
    icon = '🗃   ',
    desc = 'NvimTree                              ',
    action = 'NvimTreeToggle',
    shortcut = 'Ctrl t'
  },
  {
    icon = '⚙️  ',
    desc = 'Config                                      ',
    action = 'edit ~/.config/nvim/lua/config/init.lua',
    shortcut = ''
  },
}
db.custom_footer = { 'ShashinV Have a fun time on Neovim' }
