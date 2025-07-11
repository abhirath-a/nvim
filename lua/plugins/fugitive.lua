return {
  "tpope/vim-fugitive",
  lazy = true,
  cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
  keys = {
    {
      "<leader>gs", vim.cmd.Git
    }
  }
}
