local config = function()
	require("telescope").setup()
end

local wk = require("which-key")
wk.add({
	{
		{ "<Space>F", group = "Find" },
		{ "<Space>Ff", "<Cmd>Telescope find_files<CR>", desc = "file" },
		{ "<Space>Fw", "<Cmd>Telescope live_grep<CR>", desc = "word" },
		{ "<Space>b", group = "buffer" },
		{ "<Space>bb", "<Cmd>Telescope buffers<CR>", desc = "buffers" },
		{ "<Space>f", group = "file" },
		{ "<Space>ff", "<Cmd>Telescope find_files<CR>", desc = "find" },
	},
})

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}
