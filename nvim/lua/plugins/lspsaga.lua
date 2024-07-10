local config = function()
	require("lspsaga").setup({
		ui = {
			code_action = ""
		}
	})
end

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
	print("lspsaga is not working")
else
	wk.register({
		["c"] = {
			name = "code",
			["a"] = { "<Cmd>Lspsaga code_action<CR>", "action" },
			["d"] = { "<Cmd>Lspsaga peek_definition<CR>", "definition" },
			["f"] = { "<Cmd>Lspsaga lsp_finder<CR>", "find" },
			["h"] = { "<Cmd>Lspsaga hover_doc<CR>", "hover" },
			["i"] = { "<Cmd>Lspsaga finder imp<CR>", "implementation" },
			["j"] = { "<Cmd>Lspsaga diagnostic_jump_next<CR>", "next_diagnostics" },
			["k"] = { "<Cmd>Lspsaga diagnostic_jump_prev<CR>", "prev_diagnostics" },
			["o"] = { "<Cmd>Lspsaga outline<CR>", "outline" },
			["r"] = { "<Cmd>Lspsaga rename<CR>", "rename" },
		},
		["d"] = {
			name = "diagnostics",
			["c"] = { "<Cmd>Lspsaga show_cursor_diagnostics<Cr>", "cursor" },
			["l"] = { "<Cmd>Lspsaga show_line_diagnostics<Cr>", "line" },
		},
		["h"] = { "<Cmd>Lspsaga hover_doc<CR>", "hover" },
		["t"] = { "<Cmd>Lspsaga term_toggle<CR>", "terminal" },
	}, { prefix = "<Space>" })
end


return {
	"glepnir/lspsaga.nvim",
	event = "LspAttach",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = config
}
