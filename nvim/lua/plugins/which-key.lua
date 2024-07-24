vim.opt.timeout = true
vim.opt.timeoutlen = 300
local wk = require("which-key")
wk.add({
	{
		{ "<Space>Q",   "<Cmd>q!<CR>",                                          desc = "Quit" },
		{ "<Space>b",   group = "buffer",                                       desc = "buffer" },
		{ "<Space>bd",  "<Cmd>bd<CR>",                                          desc = "Delete" },
		{ "<Space>bn",  "<Cmd>bn<CR>",                                          desc = "Next" },
		{ "<Space>bp",  "<Cmd>bp<CR>",                                          desc = "Previous" },
		{ "<Space>f",   group = "file" },
		{ "<Space>fS",  "<Cmd>lua vim.lsp.buf.format{aync=true}<CR><Cmd>w<CR>", desc = "Format & Save" },
		{ "<Space>fs",  "<Cmd>w<CR>",                                           desc = "Save" },
		{ "<Space>w",   group = "window" },
		{ "<Space>wh",  "<C-w>h",                                               desc = "Move left" },
		{ "<Space>wj",  "<C-w>j",                                               desc = "Move down" },
		{ "<Space>wk",  "<C-w>k",                                               desc = "Move up" },
		{ "<Space>wl",  "<C-w>l",                                               desc = "Move right" },
		{ "<Space>ws",  group = "split" },
		{ "<Space>wsh", "<Cmd>split<CR>",                                       desc = "horizontally" },
		{ "<Space>wsv", "<Cmd>vsplit<CR>",                                      desc = "vertically" },
	},
})

return {
	"folke/which-key.nvim",
	opts = {
		icons = {
			mappings = false,
			rules = false,
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "center",
		},
	},
}
