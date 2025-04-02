---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
  },
  filetypes = { "lua" },
  settings = {
    Lua = {
      -- diagnostics = { globals = { "vim" } },
      format = { enable = false },
    },
  },
}
