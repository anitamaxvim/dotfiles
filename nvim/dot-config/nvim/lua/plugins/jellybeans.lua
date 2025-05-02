return {
  "wtfox/jellybeans.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    transparent = true,
    style = "dark",
    -- italics = false,
    flat_ui = true,
    plugins = {
      all = false,
      auto = true,
    },
  },
  config = function(_, opts)
    require("jellybeans").setup(opts)
    vim.cmd[[colorscheme jellybeans-muted]]
  end,
}
