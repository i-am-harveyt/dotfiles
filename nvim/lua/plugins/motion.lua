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
			local set = vim.keymap.set
			set("n", "<Space>T", "<Cmd>Telescope<CR>", { desc = "Telescope" })
			set("n", "<Space>Ff", "<Cmd>Telescope find_files<CR>", { desc = "file" })
			set("n", "<Space>Fw", "<Cmd>Telescope live_grep<CR>", { desc = "word" })
			set("n", "<Space>Fd", "<Cmd>Telescope lsp_definitions<CR>", { desc = "definitions" })
			set("n", "<Space>Fi", "<Cmd>Telescope lsp_implementations<CR>", { desc = "definitions" })
			set("n", "<Space>Ft", "<Cmd>Telescope lsp_type_definitions<CR>", { desc = "type definitions" })
			set("n", "<Space>bb", "<Cmd>Telescope buffers<CR>", { desc = "buffers" })
			set("n", "<Space>ff", "<Cmd>Telescope find_files<CR>", { desc = "find" })
			set("n", "<Space>lD", "<CMD>Telescope diagnostics<CR>", { desc = "Document Diagnostics" })
			set("n", "<Space>lW", "<CMD>Telescope lsp_workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
		end,
	},
}
