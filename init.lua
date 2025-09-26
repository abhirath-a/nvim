-- set
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.showtabline = 0
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.diagnostic.config({ virtual_text = true })
vim.g.vimwiki_list = { { path = "~/vault/", syntax = "markdown", ext = "md" } }
vim.g.vimwiki_global_ext = 0
-- remap
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<c-n>", vim.cmd.Ex)
-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf })
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = event.buf })
		if
			vim.lsp
				.get_client_by_id(event.data.client_id)
				:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion)
		then
			vim.lsp.inline_completion.enable(true)
			vim.keymap.set("i", "<Tab>", function()
				if not vim.lsp.inline_completion.get() then
					return "<Tab>"
				end
			end, {
				expr = true,
				replace_keycodes = true,
				desc = "Apply the currently displayed completion suggestion",
			})
			vim.keymap.set("i", "<M-n>", function()
				vim.lsp.inline_completion.select({})
			end, { desc = "Show next inline completion suggestion" })
			vim.keymap.set("i", "<M-p>", function()
				vim.lsp.inline_completion.select({ count = -1 })
			end, { desc = "Show previous inline completion suggestion" })
		end
	end,
})
vim.lsp.enable({ "lua_ls", "gopls", "nil_ls", "basedpyright", "vtsls", "copilot" })
