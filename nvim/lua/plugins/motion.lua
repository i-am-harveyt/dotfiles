return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup()
			require("which-key").add({
				{
					{ "<Space>F", group = "Find" },
					{ "<Space>Ff", "<Cmd>Telescope find_files<CR>", desc = "file" },
					{ "<Space>Fw", "<Cmd>Telescope live_grep<CR>", desc = "word" },
					{ "<Space>b", group = "buffer" },
					{ "<Space>bb", "<Cmd>Telescope buffers<CR>", desc = "buffers" },
					{ "<Space>f", group = "file" },
					{ "<Space>ff", "<Cmd>Telescope find_files<CR>", desc = "find" },
					{ "<Space>lD", "<CMD>Telescope diagnostics<CR>", desc = "Document Diagnostics" },
					{ "<Space>lw", "<CMD>Telescope lsp_workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
				},
			})
		end,
	},
}
