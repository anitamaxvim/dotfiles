---@type vim.lsp.Config
return {
  cmd = { "ty", "server" },
  root_markers = {
    ".git/",
    "ty.toml",
    "pyproject.toml",
  },
  filetypes = { "python" },
}
