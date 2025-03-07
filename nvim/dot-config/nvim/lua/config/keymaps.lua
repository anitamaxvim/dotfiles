local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Exit insert mode
keymap.set("i", "kj", "<ESC>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "+", "<C-x>")

-- Split window
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)
keymap.set("n", "sd", ":close<CR>", opts)

-- Move window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")

-- Select all
keymap.set("n", "sA", "gg<S-v>G", opts)
keymap.set("n", "sK", "<S-v>gg", opts)
keymap.set("n", "sJ", "<S-v>G", opts)

-- yank to system clipboard
keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)

-- paste from system clipboard
keymap.set({ "n", "v" }, "<leader>p", '"+p', opts)

keymap.set("n", "-", "<cmd>Oil<CR>")
