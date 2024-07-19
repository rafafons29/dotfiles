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
    -- you can enable a preset by setting it to true, or a table that will override the preset config
    -- you can also add custom presets that you can enable/disable with enabled=true
    bottom_search = false,         -- use a classic bottom cmdline for search
    command_palette = true,        -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = true,             -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,         -- add a border to hover docs and signature help
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
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },
  },
  lsp = {
    -- usa Noice para manejar los mensajes de LSP
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
