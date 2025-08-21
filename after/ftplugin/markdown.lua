require("obsidian").setup({
	completion = {
		blink = true,
	},
	workspaces = {
		{
			name = "vault",
			path = vim.fn.expand("~/vault"),
		},
	},
	templates = {
		folder = "5.templates",
	},
})
