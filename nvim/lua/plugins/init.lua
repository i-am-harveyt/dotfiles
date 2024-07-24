return {
	"williamboman/mason.nvim",
	"hrsh7th/nvim-cmp",
	"Exafunction/codeium.nvim",
	"lewis6991/gitsigns.nvim",
	"nvim-telescope/telescope.nvim",
	"folke/which-key.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	opts = {}
	-- },

	-- UI --
	"nvim-tree/nvim-tree.lua",
	"glepnir/lspsaga.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"phaazon/hop.nvim",
}
