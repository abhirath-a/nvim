return {
  -- {
  --   "tpope/vim-fugitive",
  --   config = function()
  --     vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
  --
  --     local Fugitive = vim.api.nvim_create_augroup("Fugitive", {})
  --
  --     local autocmd = vim.api.nvim_create_autocmd
  --     autocmd("BufWinEnter", {
  --       group = Fugitive,
  --       pattern = "*",
  --       callback = function()
  --         if vim.bo.ft ~= "fugitive" then
  --           return
  --         end
  --
  --         local bufnr = vim.api.nvim_get_current_buf()
  --         local opts = { buffer = bufnr, remap = false }
  --         vim.keymap.set("n", "<leader>p", function()
  --           vim.cmd.Git("push")
  --         end, opts)
  --
  --         -- rebase always
  --         vim.keymap.set("n", "<leader>P", function()
  --           vim.cmd.Git({ "pull", "--rebase" })
  --         end, opts)
  --
  --         -- -- NOTE: It allows me to easily set the branch i am pushing and any tracking
  --         -- -- needed if i did not set the branch up correctly
  --         -- vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
  --       end,
  --     })
  --
  --     vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
  --     vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
  --   end,
  -- },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xt",
        "<cmd>Trouble todo<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
{
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
  {
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
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".."
          end,
        },
        win_options = {
          wrap = true,
        },
      })
      vim.keymap.set("n", "<C-n>", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
    end,
  },
  -- {
  -- 	"echasnovski/mini.files",
  -- 	version = false,
  -- 	config = function()
  --      local MiniFiles = require("mini.files")
  --      MiniFiles.setup {}
  --
  -- 		vim.keymap.set("n", "<C-n>", ":lua require('mini.files').open()", { desc = "Open parent directory" })
  -- 	end,
  -- },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end)

      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
            .new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table({
                results = file_paths,
              }),
              previewer = conf.file_previewer({}),
              sorter = conf.generic_sorter({}),
            })
            :find()
      end

      vim.keymap.set("n", "<C-e>", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Open harpoon window" })
      vim.keymap.set("n", "<leader>b", function()
        harpoon:list():remove()
      end, { desc = "bye bye current buffer :)", noremap = true })
      vim.keymap.set("n", "<leader>he", function()
      	harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      -- vim.keymap.set("n", "<C-h>", function()
      -- 	harpoon:list():select(1)
      -- end)
      -- vim.keymap.set("n", "<C-t>", function()
      -- 	harpoon:list():select(2)
      -- end)
      -- vim.keymap.set("n", "<C-n>", function()
      -- 	harpoon:list():select(3)
      -- end)
      -- vim.keymap.set("n", "<C-s>", function()
      -- 	harpoon:list():select(4)
      -- end)
      --
      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<leader>z", function()
        harpoon:list():prev()
      end, { noremap = true })
      vim.keymap.set("n", "<leader>m", function()
        harpoon:list():next()
      end, { noremap = true })
    end,
  },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- calling `setup` is optional for customization
      local telescope = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", telescope.find_files, { desc = "Fzf Files" })
      vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "live grep current project" })
      vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },
  { "echasnovski/mini.comment",                 version = false, config = true },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      -- let &shell = 'pwsh'
      require("toggleterm").setup({
        shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
      })
    end,
  },
  {
    "mbbill/undotree",

    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
}
