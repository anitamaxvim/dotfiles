_G.dd = function(...) Snacks.debug.inspect(...) end
_G.bt = function() Snacks.debug.backtrace() end
vim.print = _G.dd

require("config.lazy")
require("config.keymaps")
require("config.autocmds")
require("config.options")