
return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  keys = {{ "<C-n>", "<CMD>Oil --float<CR>", desc="open oil file explorer" }},
  opts = {
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
  },
}
