local pick = require("mini.pick")
pick.setup({ source = { show = pick.default_show } })

vim.ui.select = pick.ui_select
vim.keymap.set("n", "<C-p>", function()
	pick.builtin.files({ tool = "git" })
end)
vim.keymap.set("n", "<leader>ff", pick.builtin.files)
vim.keymap.set("n", "<leader>fg", pick.builtin.grep_live)
vim.keymap.set("n", "<leader>fb", pick.builtin.buffers)
