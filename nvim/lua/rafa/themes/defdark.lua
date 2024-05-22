local status, cb = pcall(require, "colorbuddy.init")
if not status then return end

vim.cmd("colorscheme palenight")

local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local styles = cb.styles

Color.new('white', '#ffffff')
Color.new('black', '#000000')
Color.new('purple', '#c792ea')
Color.new('gray', '#2d3740')
Group.new('Normal', colors.none, colors.none, styles.NONE)
Group.new('CursorLine', colors.none, colors.none, styles.NONE, colors.none)
Group.new('CursorLineNr', colors.purple, colors.black, styles.NONE, colors.none)
Group.new('Visual', colors.none, colors.gray, styles.none)
Group.new('NormalFloat', colors.none, colors.none, styles.NONE)

-- Define custom diagnostic highlight groups
local cError = Color.new('myErrorColor', '#ea6364')
local cInfo = Color.new('myInfoColor', '#3986e9')
local cWarn = Color.new('myWarnColor', '#c3883a')
local cHint = Color.new('myHintColor', '#3986e9')

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

-- Define custom hover border highlight group
Group.new("HoverBorder", colors.yellow, colors.none, styles.NONE)

if vim.fn.has("nvim") == 1 then
  vim.api.nvim_set_var("NVIM_TUI_ENABLE_TRUE_COLOR", 1)
end

local colors = require("rafa.colors.colors_palenight")("defdark")
require("rafa.plugin.lualine.lualine")(colors)
require("rafa.plugin.bufferline.bufferline")(colors)
