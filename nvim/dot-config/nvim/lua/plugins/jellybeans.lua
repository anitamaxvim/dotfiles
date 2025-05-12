return {
  "wtfox/jellybeans.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    transparent = true,
    italics = true,
    flat_ui = true, -- toggles "flat UI" for pickers
    plugins = {
      all = false,
      auto = true, -- will read lazy.nvim and apply the colors for plugins that are installed
    },
  },
  config = function(_, opts)
    require("jellybeans").setup(opts)
    vim.cmd[[colorscheme jellybeans-mono]]
  end,
}
