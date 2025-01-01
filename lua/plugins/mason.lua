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
}
