-- return {
-- 	"ThePrimeagen/harpoon",
-- 	branch = "harpoon2",
-- 	opts = {},
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	keys = {
-- 		{
-- 			"<leader>a",
-- 			function()
-- 				require("harpoon"):list():add()
-- 			end,
-- 		},
-- 		{
-- 			"<C-e>",
-- 			function()
-- 				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
-- 			end,
-- 		},
-- 		{
-- 			"<leader>z",
-- 			function()
-- 				require("harpoon"):list():next()
-- 			end,
-- 			noremap = true,
-- 		},
-- 		{
-- 			"<leader>m",
-- 			function()
-- 				require("harpoon"):list():prev()
-- 			end,
-- 			noremap = true,
-- 		},
-- 	},
-- }
--

return {
	"otavioschwanck/arrow.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		-- or if using `mini.icons`
		-- { "echasnovski/mini.icons" },
	},
	keys = { ";", "m" },
	opts = {
		show_icons = true,
		leader_key = ";", -- Recommended to be a single key
		buffer_leader_key = "m", -- Per Buffer Mappings
	},
}
