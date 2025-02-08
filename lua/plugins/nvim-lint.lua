return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	keys = {
		{
			"<leader>l",
			function()
				require("lint").try_lint()
			end,
		},
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			astro = { "eslint" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
			svelte = { "eslint" },
			python = { "pylint" },
			-- lua = { "selene" },
		}
		-- local eslint = lint.linters.eslint_d
		--
		-- eslint.args = {
		-- 	"--no-warn-ignored", -- <-- this is the key argument
		-- 	"json",
		-- 	"-stdin",
		-- 	"--stdin-filename",
		-- 	function()
		-- 		return vim.api.nvim_buf_get_name(0)
		-- 	end,
		-- }
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
