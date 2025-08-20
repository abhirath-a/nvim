require("oil").setup({
  keymaps = {
    ["<CR>"] = "actions.select",
    ["<Right>"] = "actions.select",
    ["<Left>"] = "actions.parent",
  },
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    natural_order = true,
    is_always_hidden = function(name, _)
      return name == ".."
    end,
  },
  win_options = { wrap = true },
})

vim.keymap.set("n", "<C-n>", vim.cmd.Oil)
