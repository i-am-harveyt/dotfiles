return {
	"Exafunction/codeium.nvim",
	cmd = "Copilot", -- lazy-load on the command
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			enable_chat = true,
		})
	end,
}
