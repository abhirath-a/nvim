return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>a", function() require('harpoon'):list():add() end },
    { "<C-e>",     function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
    { "<leader>q", function() require("harpoon"):list():select(1) end },
    { "<leader>w", function() require("harpoon"):list():select(2) end },
    { "<leader>e", function() require("harpoon"):list():select(3) end },
    { "<leader>r", function() require("harpoon"):list():select(4) end },
  },
  config = function()
    require("harpoon"):setup()
  end,
}
