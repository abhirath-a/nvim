require("mini.icons").setup()
require("mini.extra").setup()
require("mini.ai").setup()
-- pick stuff
require("mini.pick").setup()
vim.ui.select = require("mini.pick").ui_select
vim.keymap.set("n", "<C-p>", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<CR>")
vim.keymap.set("n", "<leader>fc", "<cmd>Pick git_commits<CR>")
vim.keymap.set("n", "<leader>fw", "<cmd>Pick diagnostic<CR>")
