return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			local opts = {
				preset = "modern",
				delay = 0,
				layout = {
					height = { min = 4 },
					width = { min = 20 },
					spacing = 3,
				},
				icons = { mappings = false },
				sort = { "alphanum", "case" },
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
					{ "<Space>O", "<CMD>Oil<CR>", desc = "Oil" }, -- not pretty sure where is better to put this
				},
			})
		end,
	},
}
