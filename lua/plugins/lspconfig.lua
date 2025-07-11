return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {}, cmd = { "Mason", "MasonInstall" } },
    "neovim/nvim-lspconfig",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = {
      "emmet_language_server",
      "lua_ls",
      "gopls",
      "svelte",
      "tailwindcss",
      "ts_ls"
    }
  },

}
