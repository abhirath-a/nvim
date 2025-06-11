return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = { { "mason-org/mason.nvim", opts = {} } },
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = {
			"tailwindcss",
			"lua_ls",
			"emmet_language_server",
			"marksman",
			"rust_analyzer",
			"ts_ls",
			"astro",
			"jdtls",
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
						showAbbreviationSuggestions = true,
						showExpandedAbbreviation = "always",
						showSuggestionsAsSnippets = false,
					},
				})
			end,
			rust_analyzer = function()
				require("lspconfig").rust_analyzer.setup({
					settings = { ["rust-analyzer"] = { cargo = { allFeatures = true } } },
				})
			end,
			jdtls = function()
				return true
			end,
		},
	},
}
