return {
	{
	  "hrsh7th/cmp-nvim-lsp",
	},
	{
	  "hrsh7th/cmp-buffer",
	},
	{
	  "hrsh7th/cmp-cmdline",
	},
	{
	  "zbirenbaum/copilot.lua",
	  cmd = "Copilot",
	  event = "InsertEnter",
	  config = function()
	    require("copilot").setup({
	      suggestion = {enabled = true}
	    })
	  end,
	},
	-- {
	-- 	-- "zbirenbaum/copilot.lua",
	--    "github/copilot.vim"
	-- 	-- cmd = "Copilot",
	-- 	-- event = "InsertEnter",
	-- 	-- -- config = function()
	-- 	-- -- 	require("copilot").setup({})
	-- 	-- -- end,
	-- 	--   config = tru
	-- },
	-- {
	--   'VonHeikemen/lsp-zero.nvim',
	--   branch = 'v4.x',
	--   lazy = true,
	--   config = false,
	-- },
	{
	  "L3MON4D3/LuaSnip",
	  dependencies = {
	    "saadparwaiz1/cmp_luasnip",
	    "rafamadriz/friendly-snippets",
	  },
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	 {
	   "onsails/lspkind.nvim",
	 },
	 {
	   "hrsh7th/nvim-cmp",
	   config = function()
	     -- Set up nvim-cmp.
	     local cmp = require("cmp")
	     -- local lspkind = require("lspkind")

	     local has_words_before = function()
	       if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
	         return false
	       end
	       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	       return col ~= 0
	           and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
	     end

	     require("luasnip.loaders.from_vscode").lazy_load()
	     cmp.setup({
	       snippet = {
	         -- REQUIRED - you must specify a snippet engine
	         expand = function(args)
	           -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	           require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
	           -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	           -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	           -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
	         end,
	       },
	       window = {
	         completion = cmp.config.window.bordered(),
	         documentation = cmp.config.window.bordered(),
	       },
	       -- formatting = {
	       --   format = lspkind.cmp_format({
	       --     mode = "symbol",
	       --     max_width = 50,
	       --     symbol_map = { Copilot = "" },
	       --   }),
	       -- },
	       mapping = cmp.mapping.preset.insert({
	         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
	         ["<C-f>"] = cmp.mapping.scroll_docs(4),
	         ["<C-Space>"] = cmp.mapping.complete(),
	         ["<C-e>"] = cmp.mapping.abort(),
	         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	         ["<Tab>"] = vim.schedule_wrap(function(fallback)
	           if cmp.visible() and has_words_before() then
	             cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	           else
	             fallback()
	           end
	         end),
	       }),
	       sources = cmp.config.sources({

	         { name = "nvim_lsp", group_index = 2 },
	         -- { name = "copilot",  group_index = 2 },
	         -- { name = "vsnip" }, -- For vsnip users.
	         { name = "luasnip",  group_index = 2 }, -- For luasnip users.
	         -- { name = 'ultisnips' }, -- For ultisnips users.
	         -- { name = 'snippy' }, -- For snippy users.
	         -- { name = "copilot", group_index = 2 },
	       }, {
	         { name = "buffer" },
	       }),
	     })

	     -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
	     -- Set configuration for specific filetype.
	     --[[ cmp.setup.filetype('gitcommit', {
	   sources = cmp.config.sources({
	     { name = 'git' },
	   }, {
	     { name = 'buffer' },
	   })
	})
	require("cmp_git").setup() ]]
	     --

	     -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	     cmp.setup.cmdline({ "/", "?" }, {
	       mapping = cmp.mapping.preset.cmdline(),
	       sources = {
	         { name = "buffer" },
	       },
	     })

	     cmp.setup.cmdline(":", {
	       mapping = cmp.mapping.preset.cmdline(),
	       sources = cmp.config.sources({
	         { name = "path" },
	       }, {
	         {
	           name = "cmdline",
	           option = {
	             ignore_cmds = { "Man", "!" },
	           },
	         },
	       }),
	     })
	   end,
	 },
	-- {
	-- 	"saghen/blink.compat",
	-- 	-- use the latest release, via version = '*', if you also use the latest release for blink.cmp
	-- 	version = "*",
	-- 	-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
	-- 	lazy = true,
	-- 	-- make sure to set opts so that lazy.nvim calls blink.compat's setup
	-- 	opts = {},
	-- },
	-- {
	-- 	"saghen/blink.cmp",
	-- 	-- optional: provides snippets for the snippet source
	-- 	dependencies = { "rafamadriz/friendly-snippets", { "L3MON4D3/LuaSnip", version = "v2.*" } },
	--
	-- 	-- use a release tag to download pre-built binaries
	-- 	version = "*",
	-- 	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- 	build = "cargo build --release",
	-- 	-- If you use nix, you can build from source using latest nightly rust with:
	-- 	-- build = 'nix run .#build-plugin',
	--
	-- 	---@module 'blink.cmp'
	-- 	---@type blink.cmp.Config
	-- 	opts = {
	-- 		-- 'default' for mappings similar to built-in completion
	-- 		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
	-- 		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
	-- 		-- See the full "keymap" documentation for information on defining your own keymap.
	-- 		keymap = { preset = "default" },
	-- 		appearance = {
	-- 			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
	-- 			-- Useful for when your theme doesn't support blink.cmp
	-- 			-- Will be removed in a future release
	-- 			use_nvim_cmp_as_default = true,
	-- 			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
	-- 			-- Adjusts spacing to ensure icons are aligned
	-- 			nerd_font_variant = "mono",
	-- 		},
	-- 		snippets = {
	-- 			expand = function(snippet)
	-- 				require("luasnip").lsp_expand(snippet)
	-- 			end,
	-- 			active = function(filter)
	-- 				if filter and filter.direction then
	-- 					return require("luasnip").jumpable(filter.direction)
	-- 				end
	-- 				return require("luasnip").in_snippet()
	-- 			end,
	-- 			jump = function(direction)
	-- 				require("luasnip").jump(direction)
	-- 			end,
	-- 		},
	-- 		-- Default list of enabled providers defined so that you can extend it
	-- 		-- elsewhere in your config, without redefining it, due to `opts_extend`
	-- 		sources = {
	-- 			default = { "lsp", "path", "snippets", "buffer" },
	-- 		},
	-- 	},
	-- 	opts_extend = { "sources.default" },
	-- },
}
