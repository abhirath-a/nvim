return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "eslint",
          "tailwindcss",
          "tsserver",
          "lua_ls",
          "emmet_language_server",
          "marksman",
          -- "prettierd",
        },
        auto_install = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- lspconfig.lua_ls.setup({})
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local servers = {
        "eslint",
        "tailwindcss",
        "tsserver",
        "lua_ls",
        "emmet_language_server",
        "marksman",
      }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
