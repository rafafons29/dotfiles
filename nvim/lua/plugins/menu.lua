return {
  { "nvzone/volt", lazy = true },
  {
    "nvzone/menu",
    lazy = true,
    keys = {
      { "<leader>t", function()
        require("menu").open("default")
      end },
      { "<RightMouse>", function()
        vim.cmd.exec '"normal! \\<RightMouse>"'

        local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
        require("menu").open(options, { mouse = true })
      end },
    }
  },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  }
}
