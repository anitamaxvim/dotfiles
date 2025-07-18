return {
  "wtfox/jellybeans.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    transparent = true,
    italics = true,
    bold = true,
  },
  config = function(_, opts)
    require("jellybeans").setup(opts)
    vim.cmd([[colorscheme jellybeans]])
  end,
}
