return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	version = false,
	keys = {
		{ "<C-p>", "<cmd>lua require('fzf-lua').files()<cr>", desc = "fzf files" },
		{ "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<cr>", desc = "live grep" },
		{ "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<cr>", desc = "telescope buffers" },
		{ "<leader>fh", "<cmd>lua require('fzf-lua').tags()<cr>", desc = "telescope help tags" },
	},
	opts = {},
	config = function()
		require("fzf-lua").register_ui_select()
	end,
}
