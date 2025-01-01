return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "markdown",
          "go",
          "gotmpl",
          "gomod",
          "gosum",
          "rust",
          "astro",
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        compilers = {},
      })
    end,
  }
