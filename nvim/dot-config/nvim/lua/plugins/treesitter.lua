return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "VeryLazy" },
  enabled = true,
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "lua",
      "python",
      "c",
      "cpp",
      "markdown",
    },
  },
  config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
}
