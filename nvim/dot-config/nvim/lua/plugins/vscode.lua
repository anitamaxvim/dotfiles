return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    local c = require("vscode.colors").get_colors()
    require("vscode").setup({
      transparent = true,
      italic_comments = true,
      underline_links = true,
      disable_nvimtree_bg = true,
      terminal_colors = true,
      -- color_overrides = {
      --   vscLineNumber = "#FFFFFF",
      -- },

      group_overrides = {
        Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        BlinkCmpMenu = { bg = c.vscCursorDark },
      },
    })
    require("vscode").load()
    vim.cmd.colorscheme("vscode")
  end,
}
