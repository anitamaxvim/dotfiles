local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Setup language servers.

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

-- Enable servers
vim.lsp.enable({ "basedpyright", "ruff", "luals", "clangd" })
