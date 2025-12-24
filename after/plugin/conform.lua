local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		astro = { "biome" },
		javascript = { "biome" },
		typescript = { "biome" },
		javascriptreact = { "biome" },
		typescriptreact = { "biome" },
		svelte = { "biome" },
		css = { "biome" },
		html = { "biome" },
		json = { "biome" },
		yaml = { "biome" },
		markdown = { "biome" },
		graphql = { "biome" },
		lua = { "stylua" },
		java = { "google-java-format" },
		ruby = { "rubocop" },
		eruby = { "erb_format" },
		python = { "ruff" },
	},
	format_after_save = {
		lsp_fallback = true,
		async = true,
		timeout_ms = 500,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>gf", function()
	conform.format({
		lsp_fallback = true,
		async = true,
		timeout_ms = 500,
	})
end)
