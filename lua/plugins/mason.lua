return {
	-- {
	--   "williamboman/mason.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   opts = {},
	-- },
	{
		"williamboman/mason-lspconfig.nvim",
		-- lazy = false,
		dependencies = { { "williamboman/mason.nvim", opts = {} } },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"eslint",
				"tailwindcss",
				"lua_ls",
				"emmet_language_server",
				"marksman",
				"rust_analyzer",
				"ts_ls",
				"astro",
			},
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				emmet_language_server = function()
					require("lspconfig").emmet_language_server.setup({
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"vue",
							"css",
							"scss",
							"less",
							"html",
							"json",
							"jsonc",
							"yaml",
							"markdown",
							"markdown.mdx",
							"graphql",
							"handlebars",
							"svelte",
							"astro",
							"htmlangular",
						},
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
		},
	},
}
