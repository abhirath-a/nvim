return {
	-- {
	-- 	"ibhagwan/fzf-lua",
	-- 	-- optional for icon support
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- config = function()
	-- 	-- calling `setup` is optional for customization
	-- 	local fzfLua = require("fzf-lua")
	-- 	fzfLua.setup({})
	-- 	vim.keymap.set("n", "<C-p>", fzfLua.files, { desc = "Fzf Files" })
	-- 	vim.keymap.set("n", "<leader>fg", fzfLua.live_grep, { desc = "live grep current project" })
	-- end,
	-- },
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"lua",
					"javascript",
					"typescript",
					"markdown",
					"go",
					"gotmpl",
					"gomod",
					"gosum",
					"rust",
          "astro",
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				compilers = {},
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
					natural_order = true,
					is_always_hidden = function(name, _)
						return name == ".."
					end,
				},
				win_options = {
					wrap = true,
				},
			})
			vim.keymap.set("n", "<C-n>", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup()
			-- REQUIRED

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			-- vim.keymap.set("n", "<C-h>", function()
			-- 	harpoon:list():select(1)
			-- end)
			-- vim.keymap.set("n", "<C-t>", function()
			-- 	harpoon:list():select(2)
			-- end)
			-- vim.keymap.set("n", "<C-n>", function()
			-- 	harpoon:list():select(3)
			-- end)
			-- vim.keymap.set("n", "<C-s>", function()
			-- 	harpoon:list():select(4)
			-- end)
			--
			-- -- Toggle previous & next buffers stored within Harpoon list
			-- vim.keymap.set("n", "<C-S-P>", function()
			-- 	harpoon:list():prev()
			-- end)
			-- vim.keymap.set("n", "<C-S-N>", function()
			-- 	harpoon:list():next()
			-- end)
		end,
	},
	-- {
	-- 	"ThePrimeagen/harpoon",
	-- 	branch = "harpoon2",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	opts = {
	-- 		menu = {
	-- 			width = vim.api.nvim_win_get_width(0) - 4,
	-- 		},
	-- 		settings = {
	-- 			save_on_toggle = true,
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		local harpoon = require("harpoon")
	-- 		harpoon:setup()
	-- 		require("telescope").load_extension("harpoon")
	-- 		vim.keymap.set("n", "<leader>a", function()
	-- 			harpoon:list():add()
	-- 		end)
	-- 		vim.keymap.set("n", "<C-e>", function()
	-- 			harpoon.ui:toggle_quick_menu(harpoon:list())
	-- 		end)

	-- 		vim.keymap.set("n", "<C-h>", function()
	-- 			harpoon:list():select(1)
	-- 		end)
	-- 		vim.keymap.set("n", "<C-t>", function()
	-- 			harpoon:list():select(2)
	-- 		end)
	-- 		vim.keymap.set("n", "<C-n>", function()
	-- 			harpoon:list():select(3)
	-- 		end)
	-- 		vim.keymap.set("n", "<C-s>", function()
	-- 			harpoon:list():select(4)
	-- 		end)

	-- 		-- Toggle previous & next buffers stored within Harpoon list
	-- 		vim.keymap.set("n", "<C-S-P>", function()
	-- 			harpoon:list():prev()
	-- 		end)
	-- 		vim.keymap.set("n", "<C-S-N>", function()
	-- 			harpoon:list():next()
	-- 		end)
	-- 	end,
	-- 	keys = function()
	-- 		local keys = {
	-- 			{
	-- 				"<leader>H",
	-- 				function()
	-- 					require("harpoon"):list():add()
	-- 				end,
	-- 				desc = "Harpoon File",
	-- 			},
	-- 			{
	-- 				"<leader>h",
	-- 				function()
	-- 					local harpoon = require("harpoon")
	-- 					harpoon.ui:toggle_quick_menu(harpoon:list())
	-- 				end,
	-- 				desc = "Harpoon Quick Menu",
	-- 			},
	-- 		}

	-- 		for i = 1, 5 do
	-- 			table.insert(keys, {
	-- 				"<leader>" .. i,
	-- 				function()
	-- 					require("harpoon"):list():select(i)
	-- 				end,
	-- 				desc = "Harpoon to File " .. i,
	-- 			})
	-- 		end
	-- 		return keys
	-- 	end,
	-- },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- calling `setup` is optional for customization
			local telescope = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", telescope.find_files, { desc = "Fzf Files" })
			vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "live grep current project" })
			vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})
      require('telescope').load_extension('fzf')
		end,
	},
	{ "echasnovski/mini.comment", version = false, config = true },
	"echasnovski/mini.surround",
	opts = {
		-- Add custom surroundings to be used on top of builtin ones. For more
		-- information with examples, see `:h MiniSurround.config`.
		custom_surroundings = nil,

		-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
		highlight_duration = 500,

		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
			add = "ma", -- Add surrounding in Normal and Visual modes
			delete = "md", -- Delete surrounding
			find = "mf", -- Find surrounding (to the right)
			find_left = "mF", -- Find surrounding (to the left)
			highlight = "mh", -- Highlight surrounding
			replace = "mr", -- Replace surrounding
			update_n_lines = "mn", -- Update `n_lines`

			suffix_last = "l", -- Suffix to search with "prev" method
			suffix_next = "n", -- Suffix to search with "next" method
		},

		-- Number of lines within which surrounding is searched
		n_lines = 20,

		-- Whether to respect selection type:
		-- - Place surroundings on separate lines in linewise mode.
		-- - Place surroundings on each line in blockwise mode.
		respect_selection_type = false,

		-- How to search for surrounding (first inside current line, then inside
		-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
		-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
		-- see `:h MiniSurround.config`.
		search_method = "cover",

		-- Whether to disable showing non-error feedback
		silent = false,
	},
	-- {
	-- "echasnovski/mini.surround",
	--    config=true,
	-- opts = {
	-- 	-- Add custom surroundings to be used on top of builtin ones. For more
	-- 	-- information with examples, see `:h MiniSurround.config`.
	-- 	custom_surroundings = nil,
	--
	-- 	-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
	-- 	highlight_duration = 500,
	--
	-- 	-- Module mappings. Use `''` (empty string) to disable one.
	-- 	mappings = {
	-- 		add = "sa", -- Add surrounding in Normal and Visual modes
	-- 		delete = "sd", -- Delete surrounding
	-- 		find = "sf", -- Find surrounding (to the right)
	-- 		find_left = "sF", -- Find surrounding (to the left)
	-- 		highlight = "sh", -- Highlight surrounding
	-- 		replace = "sr", -- Replace surrounding
	-- 		update_n_lines = "sn", -- Update `n_lines`
	--
	-- 		suffix_last = "l", -- Suffix to search with "prev" method
	-- 		suffix_next = "n", -- Suffix to search with "next" method
	-- 	},
	--
	-- 	-- Number of lines within which surrounding is searched
	-- 	n_lines = 20,
	--
	-- 	-- Whether to respect selection type:
	-- 	-- - Place surroundings on separate lines in linewise mode.
	-- 	-- - Place surroundings on each line in blockwise mode.
	-- 	respect_selection_type = false,
	--
	-- 	-- How to search for surrounding (first inside current line, then inside
	-- 	-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
	-- 	-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
	-- 	-- see `:h MiniSurround.config`.
	-- 	search_method = "cover",
	--
	-- 	-- Whether to disable showing non-error feedback
	-- 	silent = false,
	-- },	{
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			-- let &shell = 'pwsh'
			require("toggleterm").setup({
				shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
			})
		end,
	},
	-- {
	-- 	"ryanmsnyder/toggleterm-manager.nvim",
	-- 	dependencies = {
	-- 		"akinsho/nvim-toggleterm.lua",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
	-- 	},
	-- 	config = function()
	-- 		require("toggleterm-manager").setup({})
	-- 		vim.keymap.set("n", "<C-`>", ":Telescope toggleterm_manager", { noremap = true, silent = true })
	-- 	end,
	-- },
	-- {
	--   "echasnovski/mini.files",
	--   version = false,
	--   config = function()
	--     require("mini.files").setup()
	--     vim.keymap.set("n", "<C-n>", require("mini.files").open, { desc = "Fzf Files" })
	--   end,
	-- },
}
