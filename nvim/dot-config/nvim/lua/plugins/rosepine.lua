return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = {
    varient = "moon",
    styles = {
      bold = true,
      italic = false,
      transparency = true,
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd("colorscheme rose-pine")
  end,
}
