return {

	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>gf", vim.lsp.buf.format },
	},
	opts = function()
		local null_ls = require("null-ls")
		return {
			debug = true,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd.with({
					extra_filetypes = { "astro" },
				}),
				-- null_ls.builtins.diagnostics.pylint.with({
				--   diagnostics_postprocess = function(diagnostic)
				--     diagnostic.code = diagnostic.message_id
				--   end,
				-- }),
				-- null_ls.builtins.formatting.isort,
				-- null_ls.builtins.formatting.black,
				-- null_ls.builtins.diagnostics.eslint,
				require("none-ls.diagnostics.eslint"),
			},
		}
	end,
}
