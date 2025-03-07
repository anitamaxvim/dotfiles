return {

  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "VeryLazy" },
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

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-s>",
          node_incremental = "<C-s>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = {
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },
}
