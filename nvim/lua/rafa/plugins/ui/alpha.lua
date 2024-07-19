local alpha = noty.get_plugin("alpha")
local dashboard = noty.get_plugin("alpha.themes.dashboard")

if not alpha then return end
if not dashboard then return end

-- Set header
dashboard.section.header.val = {
  '██████╗  █████╗ ███████╗ █████╗',
  '██╔══██╗██╔══██╗██╔════╝██╔══██╗',
  '██████╔╝███████║█████╗  ███████║',
  '██╔══██╗██╔══██║██╔══╝  ██╔══██║',
  '██║  ██║██║  ██║██║     ██║  ██║',
  '╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝'
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button("e", "  > New file", function()
    telescope.extensions.file_browser.file_browser({
      path = "%:p:h",
      cwd = vim.telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = "normal",
      layout_config = { height = 20 }
    })
  end),
  dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
