return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"eslint",
					"tailwindcss",
					--"typescript-language-server",
					"lua_ls",
					"emmet_language_server",
					"marksman",
					"rust_analyzer",
					"ts_ls",
					-- "prettierd",
					"astro",
					"ruff",
				},
				automatic_installation = true,
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
					emmet_language_server = function()
						require("lspconfig").emmet_language_server.setup({
							filetypes = {
								"css",
								"eruby",
								"html",
								"javascript",
								"javascriptreact",
								"less",
								"sass",
								"scss",
								"pug",
								"typescriptreact",
							},
							-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
							-- **Note:** only the options listed in the table are supported.
							init_options = {
								---@type table<string, string>
								includeLanguages = {},
								--- @type string[]
								excludeLanguages = {},
								--- @type string[]
								extensionsPath = {},
								--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
								preferences = {},
								--- @type boolean Defaults to `true`
								showAbbreviationSuggestions = true,
								--- @type "always" | "never" Defaults to `"always"`
								showExpandedAbbreviation = "always",
								--- @type boolean Defaults to `false`
								showSuggestionsAsSnippets = false,
								--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
								syntaxProfiles = {},
								--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
								variables = {},
							},
						})
					end,
					-- ruff = function()
					--   require("lspconfig").ruff.setup({
					--     -- trace = "messages",
					--     -- init_options = {
					--     --   settings = {
					--     --     logLevel = "debug",
					--     --   },
					--     -- },
					--   })
					-- end,
					rust_analyzer = function()
						require("lspconfig").rust_analyzer.setup({

							settings = {
								["rust-analyzer"] = {
									cargo = {
										allFeatures = true,
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		init = function()
			vim.opt.signcolumn = "yes"
		end,
		dependencies = { "saghen/blink.cmp" },
		config = function()
			-- lspconfig.lua_ls.setup({})
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities(
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen

			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			local lspconfig_defaults = require("lspconfig").util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
				-- require("blink.cmp").get_lsp_capabilities()
			)

			-- This is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
					vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				end,
			})
			-- local lspconfig = require("lspconfig")
			-- local servers = {
			-- 	"eslint",
			-- 	"tailwindcss",
			-- 	"ts_ls",
			-- 	"lua_ls",
			-- 	"emmet_language_server",
			-- 	"marksman",
			-- 	"astro",
			-- }
			-- for _, lsp in ipairs(servers) do
			-- 	lspconfig[lsp].setup({
			-- 		-- capabilities = capabilities,
			-- 	})
			-- end
			-- -- rust analyzer needs special setup due to the fact that I want crates autocompletion
			-- lspconfig.rust_analyzer.setup({
			-- 	-- capabilities = capabilities,
			-- 	settings = {
			-- 		["rust-analyzer"] = {
			-- 			cargo = {
			-- 				allFeatures = true,
			-- 			},
			-- 		},
			-- 	},
			-- })
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
