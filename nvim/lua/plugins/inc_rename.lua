return {
  "smjonas/inc-rename.nvim",
  npts = {
    presets = { inc_rename = true }
  },
  config = function()
    require("inc_rename").setup()
  end,
}
