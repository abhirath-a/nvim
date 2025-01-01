return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd([[colorscheme tokyonight-night]])
	-- 	end,
	-- },
    {
    "sam4llis/nvim-tundra",
    priority = 10000,
    config = function()
      vim.g.tundra_biome = "arctic" -- 'arctic' or 'jungle'
      vim.opt.background = "dark"
      vim.cmd("colorscheme tundra")
    end,
  },
--   {
--     "dasupradyumna/midnight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function() vim.cmd.colorscheme("midnight") end,
-- }
}
