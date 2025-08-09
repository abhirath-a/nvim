require("abhi.opts")
require("abhi.keymaps")
require("lze").load("abhi.plugins")
vim.lsp.enable({ "lua_ls", "gopls", "nil_ls" })
