return {

    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        debug=true,
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd.with({
            extra_filetypes = { "astro" },
          }),
          -- null_ls.builtins.diagnostics.pylint.with({
          --   diagnostics_postprocess = function(diagnostic)
          --     diagnostic.code = diagnostic.message_id
          --   end,
          -- }),
          -- null_ls.builtins.formatting.isort,
          -- null_ls.builtins.formatting.black,
           -- null_ls.builtins.diagnostics.eslint,
          require("none-ls.diagnostics.eslint"),
        },
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  }
