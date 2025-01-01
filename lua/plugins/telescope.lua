return {

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- calling `setup` is optional for customization
      local telescope = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", telescope.find_files, { desc = "Fzf Files" })
      vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "live grep current project" })
      vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
