-- past themes
-- ! folke/tokyonight.nvim
-- AstroNvim/astrotheme *requires setup
-- navarasu/onedark.nvim *requires setup and is loaded thru .load func
-- tiagovla/tokyodark.nvim *requires setup
-- sainnhe/gruvbox-material
-- craftzdog/solarized-osaka.nvim *requires setup
-- Mofiqul/vscode.nvim
-- catppuccin/nvim *requires setup w/ flavour eg. { flavour: "mocha" }
-- rose-pine/neovim
-- sam4llis/nvim-tundra *requires setup
-- diegoulloao/neofusion.nvim
-- AlexvZyl/nordic.nvim *uses custom load function .load
-- rebelot/kanagawa.nvim
-- dasupradyumna/midnight.nvim
-- ellisonleao/gruvbox.nvim *requires opts
-- projekt0n/github-nvim-theme *rqeuires opts and name of "github-theme"
-- Shatur/neovim-ayu *requires setup
return {
    "folke/tokyonight.nvim",
    config = function()
       vim.cmd.colorscheme "tokyonight-night"
   end,
}
