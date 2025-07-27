return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			local opts = {
				preset = "modern",
				delay = 200,
				layout = {
					height = { min = 4 },
					width = { min = 20 },
					spacing = 3,
				},
				icons = { mappings = false },
				sort = { "alphanum", "case" },
				win = {
					wo = {
						winblend = 10,
					},
					border = "none",
				},
			}
			wk.setup(opts)
			wk.add({
				{
					{ "<Space>b", group = "buffer" },
					{ "<Space>f", group = "file" },
					{ "<Space>F", group = "Find" },
					{ "<Space>w", group = "window" },
					{ "<Space>ws", group = "split" },
					{ "<Space>l", group = "LSP" },
					{ "<Space>E", "<CMD>Fyler<CR>", desc = "Fyler" }, -- not pretty sure where is better to put this
				},
			})
		end,
	},
}
