return {
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
      -- {}
				-- require("cmp_nvim_lsp").default_capabilities()
				require("blink.cmp").get_lsp_capabilities()
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
	}
