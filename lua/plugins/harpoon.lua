return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim"},
  keys = {
    {"<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>"},
    {"<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>"},
    {"<leader>z", "<cmd>lua require('harpoon.ui').nav_next()<cr>", noremap=true},
    {"<leader>m", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",noremap=true}
  },
  opts = {},
}
