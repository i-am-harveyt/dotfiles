local set = vim.keymap.set

return {
	"lewis6991/gitsigns.nvim",
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("snacks").setup({
				bigfile = { enabled = true },
				explorer = {},
				indent = { enabled = true },
				picker = {
					icons = { files = { enabled = false } },
					sources = {
						explorer = {
							win = {
								list = {
									keys = {
										["o"] = "confirm",
										["O"] = "explorer_open", -- open with system application(Finder for MacOS)
									},
								},
							},
							layout = {
								layout = {
									position = "right",
								},
							},
						},
					},
				},
				quickfile = { enabled = true },
				scope = { enabled = true },
				words = { enabled = true },
			})
			set("n", "<Space>e", function()
				Snacks.explorer({ layout = { layout = { position = "right" } } })
			end, { desc = "[E]xplorer" })

			set("n", "<Space>P", function()
				Snacks.picker()
			end, { desc = "[P]icker" })
			set("n", "<Space>Ff", function()
				Snacks.picker.files()
			end, { desc = "[F]ind [F]ile" })
			set("n", "<Space>Fw", function()
				Snacks.picker.grep()
			end, { desc = "[F]ind [W]ord" })
			set("n", "<Space>Fr", function()
				Snacks.picker.lsp_references()
			end, { desc = "[F]ind [R]ef" })
			set("n", "<Space>Fd", function()
				Snacks.picker.lsp_definitions()
			end, { desc = "[F]ind [D]ef" })
			set("n", "<Space>Fi", function()
				Snacks.picker.lsp_implementations()
			end, { desc = "[F]ind [I]mpl" })
		end,
	},
	{
		"A7Lavinraj/fyler.nvim",
		dependencies = { "echasnovski/mini.icons" },
		opts = {},
	},
}
