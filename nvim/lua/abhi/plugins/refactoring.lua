return {
  "refactoring.nvim",
  keys = {
    {
      "<leader>re",
      function()
        return require("refactoring").refactor("Extract Function")
      end,
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<leader>rv",
      function()
        return require("refactoring").refactor("Extract Variable")
      end,
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<leader>rf",
      function()
        return require("refactoring").refactor("Extract Function To File")
      end,
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<leader>rI",
      function()
        return require("refactoring").refactor("Inline Function")
      end,
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<leader>ri",
      function()
        return require("refactoring").refactor("Inline Variable")
      end,
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<leader>rbb",
      function()
        return require("refactoring").refactor("Extract Block")
      end,
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<leader>rbf",
      function()
        return require("refactoring").refactor("Extract Block To File")
      end,
      mode = { "n", "x" },
      expr = true,
    },
  },
  after = function()
    require("refactoring").setup({})
  end,
}
