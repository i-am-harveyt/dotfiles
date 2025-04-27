return {
	{
		"nvim-neorg/neorg",
		ft = "norg",
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.highlights"] = {},
					["core.integrations.treesitter"] = {},
					["core.ui"] = {},
					["core.queries.native"] = {},

					["core.concealer"] = {
						config = { -- We added a `config` table!
							icon_preset = "varied", -- And we set our option here.
						},
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/neorg/notes",
								thesis = "~/neorg/thesis",
							},
						},
					},
					["core.export"] = {},
					["core.presenter"] = {
						config = {
							zen_mode = "zen-mode",
						},
					},
				},
			})
			vim.keymap.set("n", "<Space>N", ":Neorg<CR>", { desc = "[N]eorg" })
		end,
	},
}
