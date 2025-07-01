local web_formatters = { "prettier" }
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
      astro = web_formatters,
      javascript = web_formatters,
      typescript = web_formatters,
      javascriptreact = web_formatters,
      typescriptreact = web_formatters,
      svelte = web_formatters,
      css = web_formatters,
      html = web_formatters,
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
      java = { "google-java-format" },
      ruby = { "rubocop" },
      eruby = { "erb_format" },
      -- python = { "isort", "black" },
    },
    format_after_save = {
      lsp_fallback = true,
      async = true,
      timeout_ms = 500,
    },
  },
}
