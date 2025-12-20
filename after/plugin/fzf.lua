local fzfLua = require("fzf-lua")

fzfLua.setup({
	fzf_colors = {
		bg = "-1",
	},
})

fzfLua.register_ui_select()

vim.keymap.set("n", "<leader>ff", fzfLua.files)
vim.keymap.set("n", "<leader>fg", fzfLua.live_grep_native)
vim.keymap.set("n", "<leader>fb", fzfLua.buffers)
vim.keymap.set("n", "<leader>u", fzfLua.undotree)
