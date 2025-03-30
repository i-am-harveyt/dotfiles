return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				theme = "wave", -- vim.o.background = ""
				background = {
					dark = "wave", -- vim.o.background = "dark"
					light = "lotus", -- vim.o.background = "light"
				},
			})
			vim.cmd([[colorscheme kanagawa-wave]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd([[colorscheme tokyonight-storm]])
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			local gruvbox = require("gruvbox")
			gruvbox.setup({
				transparent_mode = true,
			})
			-- vim.cmd([[colorscheme gruvbox]])
		end,
	},
}
