return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup({
				preset = "modern",
				layout = {
					height = { min = 4 },
					width = { min = 20 },
					spacing = 3,
				},
				icons = { mappings = false },
				sort = { "case", "alphanum" },
			})
			wk.add({
				{
					-- essential
					{ "<Space>Q", "<Cmd>q!<CR>", desc = "Quit" },

					{ "<Space>b", group = "buffer", desc = "buffer" },
					{ "<Space>bd", "<Cmd>bd<CR>", desc = "Delete" },
					{ "<Space>bn", "<Cmd>bn<CR>", desc = "Next" },
					{ "<Space>bp", "<Cmd>bp<CR>", desc = "Previous" },

					{ "<Space>f", group = "file" },
					{ "<Space>fs", "<Cmd>w<CR>", desc = "Save" },

					{ "<Space>w", group = "window" },
					{ "<Space>wh", "<C-w>h", desc = "Move left" },
					{ "<Space>wj", "<C-w>j", desc = "Move down" },
					{ "<Space>wk", "<C-w>k", desc = "Move up" },
					{ "<Space>wl", "<C-w>l", desc = "Move right" },

					{ "<Space>ws", group = "split" },
					{ "<Space>wsh", "<Cmd>split<CR>", desc = "horizontally" },
					{ "<Space>wsv", "<Cmd>vsplit<CR>", desc = "vertically" },

					-- Oil
					{ "<Space>O", "<Cmd>Oil<CR>", desc = "Oil" },

					--LSP
					{ "<Space>l", group = "LSP" },
					{ "<Space>la", "<CMD>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
					{ "<Space>ld", "<CMD>lua vim.lsp.buf.definition()<CR>", desc = "Definition" },
					{ "<Space>lh", "<CMD>lua vim.lsp.buf.hover()<CR>", desc = "hover" },
					{ "<Space>lj", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
					{ "<Space>lk", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", desc = "Prev Diagnostic" },
					{ "<Space>ll", "<CMD>lua vim.lsp.codelens.run()<CR>", desc = "CodeLens Action" },
					{ "<Space>lq", "<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>", desc = "Quickfix" },
					{ "<Space>lr", "<CMD>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
				},
			})
		end,
	},
}
-- {
-- 	"m4xshen/hardtime.nvim",
-- 	opts = {}
-- },
