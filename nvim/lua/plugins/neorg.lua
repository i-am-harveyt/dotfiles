return {
	{
		"nvim-neorg/neorg",
		ft = "norg",
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {
						config = { -- We added a `config` table!
							icon_preset = "varied", -- And we set our option here.
						},
					},
					["core.dirman"] = {
						notes = "~/neorg",
					},
				},
			})
			require("which-key").add({
				{
					{ "<Space>N", ":Neorg<CR>", desc = "neorg" },
				},
			})
		end,
	},
}
