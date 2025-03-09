local set = vim.keymap.set

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
			set("n", "<Space>T", "<Cmd>Telescope<CR>", { desc = "[T]elescope" })
			set("n", "<Space><Space>", "<Cmd>Telescope find_files<CR>", { desc = "Find File" })
			set("n", "<Space>Ff", "<Cmd>Telescope find_files<CR>", { desc = "[F]ind [F]ile" })
			set("n", "<Space>Fw", "<Cmd>Telescope live_grep<CR>", { desc = "[F]ind [W]ord" })
			set("n", "<Space>Fd", "<Cmd>Telescope lsp_definitions<CR>", { desc = "[F]ind [D]efinitions" })
			set("n", "<Space>Fi", "<Cmd>Telescope lsp_implementations<CR>", { desc = "[F]ind [I]mplementations" })
			set("n", "<Space>Fr", "<Cmd>Telescope lsp_references<CR>", { desc = "[F]ind [R]eferences" })
			set("n", "<Space>Ft", "<Cmd>Telescope lsp_type_definitions<CR>", { desc = "[F]ind [T]ype Definitions" })
			set("n", "<Space>bb", "<Cmd>Telescope buffers<CR>", { desc = "[B]uffers" })
			set("n", "<Space>ff", "<Cmd>Telescope find_files<CR>", { desc = "[F]ile [F]ind" })
			set("n", "<Space>FD", "<CMD>Telescope diagnostics<CR>", { desc = "[F]ind [D]iagnostics" })
		end,
	},
}
