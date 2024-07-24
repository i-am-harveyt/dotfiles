local config = function()
	require("lspsaga").setup({
		ui = {
			code_action = "",
		},
	})
end

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
	print("lspsaga is not working")
else
	wk.add({
		{
			{ "<Space>c", group = "code" },
			{ "<Space>ca", "<Cmd>Lspsaga code_action<CR>", desc = "action" },
			{ "<Space>cd", "<Cmd>Lspsaga peek_definition<CR>", desc = "definition" },
			{ "<Space>cf", "<Cmd>Lspsaga lsp_finder<CR>", desc = "find" },
			{ "<Space>ch", "<Cmd>Lspsaga hover_doc<CR>", desc = "hover" },
			{ "<Space>ci", "<Cmd>Lspsaga finder imp<CR>", desc = "implementation" },
			{ "<Space>cj", "<Cmd>Lspsaga diagnostic_jump_next<CR>", desc = "next_diagnostics" },
			{ "<Space>ck", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "prev_diagnostics" },
			{ "<Space>co", "<Cmd>Lspsaga outline<CR>", desc = "outline" },
			{ "<Space>cr", "<Cmd>Lspsaga rename<CR>", desc = "rename" },
			{ "<Space>d", group = "diagnostics" },
			{ "<Space>dc", "<Cmd>Lspsaga show_cursor_diagnostics<Cr>", desc = "cursor" },
			{ "<Space>dl", "<Cmd>Lspsaga show_line_diagnostics<Cr>", desc = "line" },
			{ "<Space>h", "<Cmd>Lspsaga hover_doc<CR>", desc = "hover" },
			{ "<Space>t", "<Cmd>Lspsaga term_toggle<CR>", desc = "terminal" },
		},
	})
end

return {
	"glepnir/lspsaga.nvim",
	event = "LspAttach",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = config,
}
