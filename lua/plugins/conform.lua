return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>gf",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = true,
          timeout_ms = 500,
        })
      end,
      mode = { "n", "v" },
    },
  },
  opts = {
    formatters_by_ft = {
      astro = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
      java = { "google-java-format" },
      ruby = { "rubocop" },
      eruby = { "erb_format" },
    },
    format_after_save = {
      lsp_fallback = true,
      async = true,
      timeout_ms = 500,
    },
  },
}
