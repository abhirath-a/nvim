return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
-- 	{
-- 		"nvimdev/dashboard-nvim",
-- 		event = "VimEnter",
-- 		config = function()
-- 			local logo = [[
--  █████╗ ██████╗ ██╗  ██╗██╗  ██╗   ██╗██╗███╗   ███╗██╗
-- ██╔══██╗██╔══██╗██║  ██║██║  ██║   ██║██║████╗ ████║██║
-- ███████║██████╔╝███████║██║  ██║   ██║██║██╔████╔██║██║
-- ██╔══██║██╔══██╗██╔══██║██║  ╚██╗ ██╔╝██║██║╚██╔╝██║╚═╝
-- ██║  ██║██████╔╝██║  ██║██║██╗╚████╔╝ ██║██║ ╚═╝ ██║██╗
-- ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝
--   ]]
--
-- 			logo = string.rep("\n", 8) .. logo .. "\n\n"
--
-- 			require("dashboard").setup({
-- 				config = {
--
-- 					header = vim.split(logo, "\n"),
-- 				},
-- 			})
-- 		end,
-- 		dependencies = { { "nvim-tree/nvim-web-devicons" } },
-- 	},
{
    'goolord/alpha-nvim',
    config = function ()
       local alpha = require("alpha")
       local dashboard = require('alpha.themes.startify')
       dashboard.section.header.val = {
          
  [[  █████╗ ██████╗ ██╗  ██╗██╗  ██╗   ██╗██╗███╗   ███╗██╗ ]],
  [[ ██╔══██╗██╔══██╗██║  ██║██║  ██║   ██║██║████╗ ████║██║ ]],
  [[ ███████║██████╔╝███████║██║  ██║   ██║██║██╔████╔██║██║ ]],
  [[ ██╔══██║██╔══██╗██╔══██║██║  ╚██╗ ██╔╝██║██║╚██╔╝██║╚═╝ ]],
  [[ ██║  ██║██████╔╝██║  ██║██║██╗╚████╔╝ ██║██║ ╚═╝ ██║██╗ ]],
  [[ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝ ]]
     }
                 alpha.setup(dashboard.config)
      
    end
},

	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme rose-pine-moon]])
	-- 	end,
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.o.background = "dark"
	-- 		vim.cmd([[colorscheme gruvbox]])
	-- 	end,
	-- },
	--	{
	--	"Shatur/neovim-ayu",
	--priority = 1000,
	--lazy = false,
	--	config = function()
	--		vim.cmd([[colorscheme ayu]])
	--	end,
	-- },
	-- {
	--"akinsho/bufferline.nvim",
	--version = "*",
	--dependencies = "nvim-tree/nvim-web-devicons",
	--	config = function()
	--require("bufferline").setup({})
	--end,
	--},
	--	{
	--	"zaldih/themery.nvim",
	--		lazy = false,
	--		config = function()
	--			require("themery").setup({
	--				themes = { "gruvbox", "ayu", "rose-pine", "tokyonight" },
	--			})
	--		end,
	--	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	config = function()
	-- 		require("noice").setup({
	-- 			lsp = {
	-- 				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	-- 				override = {
	-- 					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 					["vim.lsp.util.stylize_markdown"] = true,
	-- 					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
	-- 				},
	-- 			},
	-- 			-- you can enable a preset for easier configuration
	-- 			presets = {
	-- 				bottom_search = true, -- use a classic bottom cmdline for search
	-- 				command_palette = true, -- position the cmdline and popupmenu together
	-- 				long_message_to_split = true, -- long messages will be sent to a split
	-- 				inc_rename = false, -- enables an input dialog for inc-rename.nvim
	-- 				lsp_doc_border = false, -- add a border to hover docs and signature help
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		priority = 999,
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
