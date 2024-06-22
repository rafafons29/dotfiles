local noice = vim.get_plugin("noice")
if not noice then return end

noice.setup({
  cmdline = {
    format = {
      cmdline = { icon = ">" },
      search_down = { icon = "🔍⌄" },
      search_up = { icon = "🔍⌃" },
      filter = { icon = "$" },
      lua = { icon = "☾" },
      help = { icon = "?" },
    },
  },
  format = {
    level = {
      icons = {
        error = "✖",
        warn = "▼",
        info = "●",
      },
    },
  },
  popupmenu = {
    kind_icons = true,
  },
  inc_rename = {
    cmdline = {
      format = {
        IncRename = { icon = "⟳" },
      },
    },
  },
  presets = {
    -- you can enable a preset by setting it to true, or a table that will override the preset config
    -- you can also add custom presets that you can enable/disable with enabled=true
    bottom_search = false,         -- use a classic bottom cmdline for search
    command_palette = false,       -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false,            -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,        -- add a border to hover docs and signature help
  },
  throttle = 1000 / 30,            -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
  ---@type NoiceConfigViews
  views = {
    split = {
      enter = true,
    },
  }, ---@see section on views
  ---@type NoiceRouteConfig[]
  ---@type table<string, NoiceFilter>
  status = {}, --- @see section on statusline components
  routes = {},
})

vim.keymap.set("n", "<leader>nl", function()
  noice.cmd("last")
end)

vim.keymap.set("n", "<leader>nh", function()
  noice.cmd("history")
end)
