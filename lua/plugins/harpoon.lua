return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	opts = {},
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
		},
		{
			"<C-e>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
		},
		{
			"<leader>z",
			function()
				require("harpoon"):list():next()
			end,
			noremap = true,
		},
		{
			"<leader>m",
			function()
				require("harpoon"):list():prev()
			end,
			noremap = true,
		},
	},
}
