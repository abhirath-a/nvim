-- basic options
vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true
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
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"

-- netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- keymaps
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
vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>a", function()
	vim.cmd("$argadd %")
	vim.cmd("argdedup")
end)

vim.keymap.set("n", "<C-e>", "<cmd>args<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>silent! 1argument<CR>")
vim.keymap.set("n", "<leader>j", "<cmd>silent! 2argument<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>silent! 3argument<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>silent! 4argument<CR>")

-- treesitter
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		pcall(vim.treesitter.start, ev.buf)
	end,
})

-- lsp and diagnostics
vim.diagnostic.config({ virtual_text = true })
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf })
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = event.buf })
	end,
})
vim.lsp.enable({ "lua_ls", "gopls", "nil_ls", "basedpyright", "vtsls", "rust_analyzer", "marksman" })
