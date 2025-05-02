return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function(_, opts)
    require("ibl").setup({
      indent = { char = "┆" },
      scope = { enabled = false },
    })
  end,
}
