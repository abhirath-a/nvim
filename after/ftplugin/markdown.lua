vim.o.conceallevel = 2

if vim.g.loaded_obsidian then
	return
end

vim.g.loaded_obsidian = true

require("obsidian").setup({
	completion = { blink = true },
	workspaces = { { name = "vault", path = vim.fn.expand("~/vault") } },
	legacy_commands = false,
	templates = { folder = "5.templates" },
})
