return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>ff",
        function() require("conform").format({ async = true }) end,
        mode = "n",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = {
          "ruff_fix",
          "ruff_organize_imports",
          "ruff_format",
        },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    },
  },
}
