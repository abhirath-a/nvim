return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	-- event = "VeryLazy",
	keys = {
		-- {
		-- 	"<C-p>",
		-- 	function()
		-- 		Snacks.picker.files()
		-- 	end,
		-- 	desc = "fzf files",
		-- },
		-- {
		-- 	"<leader>fg",
		-- 	function()
		-- 		Snacks.picker.grep()
		-- 	end,
		-- 	desc = "live grep",
		-- },
		-- {
		-- 	"<leader>fb",
		-- 	function()
		-- 		Snacks.picker.buffers()
		-- 	end,
		-- 	desc = "telescope buffers",
		-- },
		-- {
		-- 	"<leader>fh",
		-- 	function()
		-- 		Snacks.picker.help()
		-- 	end,
		-- 	desc = "telescope help tags",
		-- },
		-- {
		-- 	"<leader>fs",
		-- 	function()
		-- 		Snacks.picker.spelling()
		-- 	end,
		-- 	desc = "Spelling suggestions",
		-- },
		{
			"<C-q>",
			function()
				Snacks.lazygit.open()
			end,
			desc = "lazygit",
		},
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true, style = "fancy" },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		input = { enabled = true },
		-- picker = {
		-- 	enabled = true,
		-- 	exclude = { -- add folder names here to exclude
		-- 		".git",
		-- 		"node_modules",
		-- 	},
		-- },
		dashboard = {
			width = 60,
			pane_gap = 4, -- empty columns between vertical panes
			preset = {
				header = [[
 █████╗ ██████╗ ██╗  ██╗██╗  ██╗   ██╗██╗███╗   ███╗██╗
██╔══██╗██╔══██╗██║  ██║██║  ██║   ██║██║████╗ ████║██║
███████║██████╔╝███████║██║  ██║   ██║██║██╔████╔██║██║
██╔══██║██╔══██╗██╔══██║██║  ╚██╗ ██╔╝██║██║╚██╔╝██║╚═╝
██║  ██║██████╔╝██║  ██║██║██╗╚████╔╝ ██║██║ ╚═╝ ██║██╗
╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝
		   ]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 2 },
				-- { icon = " ", title = "Recent Files", section = "recent_files", indent = 2,padding = 2  },
				-- { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
				{ section = "startup" },
			},
		},
	},
}
