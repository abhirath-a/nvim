local lsp_formatting = function()
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
	})
end
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	event = { "BufWritePre" },
	keys = {
		{
			"<leader>gf",
			function()
				vim.lsp.buf.format()
			end,
		},
	},
	opts = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		return {
			debug = false,
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
				require("none-ls.diagnostics.eslint"),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							lsp_formatting()
						end,
					})
				end
			end,
		}
	end,
}
