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
	legacy_commands = false,
	templates = {
		folder = "5.templates",
	},
})
