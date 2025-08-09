return {
  {
    "kanagawa.nvim",
    before = function()
      require("kanagawa").setup({ transparent = true })
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "vim-fugitive",
    keys = {
      {
        "<leader>gs",
        vim.cmd.Git,
      },
    },
  },
  {
    "undotree",
    keys = {
      {
        "<leader>u",
        vim.cmd.UndotreeToggle,
      },
    },
  },
  {
    "fidget.nvim",
    lazy = false,
    after = function()
      require("fidget").setup({
        notification = {
          override_vim_notify = true,
        },
      })
    end,
  },
  {
    "ts-autotag",
    ft = {
      "astro",
      "glimmer",
      "handlebars",
      "html",
      "javascript",
      "jsx",
      "markdown",
      "php",
      "rescript",
      "svelte",
      "tsx",
      "twig",
      "typescript",
      "vue",
      "xml",
    },
    after = function()
      require("ts-autotag").setup()
    end,
  },
  {
    "vim-surround"
  },
  {
    "plenary.nvim",
    dep_of = { "harpoon", "refactoring" },
  },

  { import = "abhi.plugins.oil" },
  { import = "abhi.plugins.mini" },
  { import = "abhi.plugins.blink" },
  { import = "abhi.plugins.conform" },
  { import = "abhi.plugins.lint" },
  { import = "abhi.plugins.refactoring" },
  { import = "abhi.plugins.harpoon" },
  { import = "abhi.plugins.obsidian" },
}
