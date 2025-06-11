return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({ transparent = false })
			vim.cmd([[colorscheme solarized-osaka]])
		end,
	},
	-- {
	-- 	"Mofiqul/vscode.nvim",
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd.colorscheme("vscode")
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({ flavour = "mocha" })
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd([[colorscheme tokyonight-moon]])
	-- 	end,
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
	-- {
	-- 	"sam4llis/nvim-tundra",
	-- 	priority = 10000,
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.g.tundra_biome = "arctic" -- 'arctic' or 'jungle'
	-- 		vim.opt.background = "dark"
	-- 		vim.cmd("colorscheme tundra")
	-- 	end,
	-- },
	-- {
	-- 	"diegoulloao/neofusion.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.o.background = "dark"
	-- 		vim.cmd([[ colorscheme neofusion ]])
	-- 	end,
	-- },
	-- {
	-- 	"AlexvZyl/nordic.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("nordic").load()
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme kanagawa")
	-- 	end,
	-- },
	--
	--   {
	--     "dasupradyumna/midnight.nvim",
	--     lazy = false,
	--     priority = 1000,
	--     config = function() vim.cmd.colorscheme("midnight") end,
	-- }
	--
	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	name = "github-theme",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000,-- make sure to load this before all the other start plugins
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd("colorscheme github_dark_default")
	-- 	end,
	-- },
	-- {
	-- 	"Shatur/neovim-ayu",
	-- 	priority = 1000,
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("ayu").setup({
	-- 			mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
	-- 			terminal = false, -- Set to `false` to let terminal manage its own colors.
	-- 			overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
	-- 		})
	-- 		vim.cmd.colorscheme("ayu-dark")
	-- 	end,
	-- },
}
