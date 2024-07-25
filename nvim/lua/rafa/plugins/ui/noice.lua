local noice = noty.get_plugin("noice")
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
    view = "cmdline",
  },
  format = {
    level = {
      icons = {
        error = " ",
        warn = " ",
        info = " ",
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
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = true,            -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },
  messages = {
    enabled = true,            -- enables the Noice messages UI
    view = "notify",           -- default view for messages
    view_error = "notify",     -- view for errors
    view_warn = "notify",      -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = false,       -- view for search count messages. Set to `false` to disable
  },
  throttle = 1000 / 30,
  views = {
    split = {
      enter = true,
    },
  }, ---@see section on views
  ---@type NoiceRouteConfig[]
  ---@type table<string, NoiceFilter>
  status = {}, --- @see section on statusline components
  routes = {
    {
      filter = { event = "msg_show" },
      view = "mini",
    },
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- configuración de notificaciones
  notify = {
    enabled = true,
    view = "notify",
  },
  -- configuración de los comandos
  commands = {
    history = {
      view = "split",
      opts = { enter = true, skip = true, format = "details" },
      filter = {},
    },
  },
})

keymap.set({ "n", "i", "s" }, "<c-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-f>"
  end
end, { silent = true, expr = true })

keymap.set({ "n", "i", "s" }, "<c-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<c-b>"
  end
end, { silent = true, expr = true })
