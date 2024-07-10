return {
	-- mason & LSPs
	"williamboman/mason.nvim",
	-- auto complete
	"hrsh7th/nvim-cmp",
	-- codeium
	"Exafunction/codeium.nvim",
	-- gitsigns
	"lewis6991/gitsigns.nvim",
	-- telescope
	"nvim-telescope/telescope.nvim",
	-- which-key
	"folke/which-key.nvim",
	-- null-ls
	"jose-elias-alvarez/null-ls.nvim",
	-- auto-pair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	-- comment
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("Comment").setup()
		end,
	},
	-- Markdown preview
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
	-- nvimtree
	"nvim-tree/nvim-tree.lua",

	-- lspsaga
	"glepnir/lspsaga.nvim",
	-- indent line
	"lukas-reineke/indent-blankline.nvim",
	-- hop
	"phaazon/hop.nvim",
}
