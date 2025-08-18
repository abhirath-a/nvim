return {
  "nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>l",
      function()
        require("lint").try_lint(nil, { ignore_errors = true })
      end,
    },
  },
  after = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      astro = { "eslint" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      svelte = { "eslint" },
      python = { "ruff" },
      ruby = { "rubocop" },
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })
  end,
}
