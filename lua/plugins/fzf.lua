return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  version = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<C-p>",      "<cmd>lua require('fzf-lua').files()<cr>",     desc = "fzf files" },
    { "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<cr>", desc = "live grep" },
    { "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<cr>",   desc = "telescope buffers" },
    { "<leader>fh", "<cmd>lua require('fzf-lua').tags()<cr>",      desc = "telescope help tags" },
    { "<leader>fc", "<cmd>FzfLua git_commits<CR>",                 desc = "Commits" },
    { "<leader>fs", "<cmd>FzfLua git_status<CR>",                  desc = "Status" },
  },
  opts = {},
  config = function()
    require("fzf-lua").register_ui_select()
  end,
}
