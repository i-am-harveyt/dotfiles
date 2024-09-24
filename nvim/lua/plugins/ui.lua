return {
	"lewis6991/gitsigns.nvim",
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<Space>e", "<Cmd>NvimTreeToggle<CR>", desc = "File Tree" },
		},
		config = function()
			local nt = require("nvim-tree")
			nt.setup({
				diagnostics = { enable = true, show_on_dirs = true },
				git = { enable = true, show_on_dirs = true, timeout = 200 },
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")
					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end
					api.config.mappings.default_on_attach(bufnr)
					vim.keymap.set("n", "c", api.tree.change_root_to_node, opts("CD")) -- change dir
					vim.keymap.set("n", "N", api.fs.create, opts("create")) -- create
					vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up")) -- up
					vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help")) -- help
				end,
				update_focused_file = { enable = true },
				renderer = {
					group_empty = true,
					icons = {
						show = {
							file = true,
							folder = false,
							folder_arrow = false,
							git = true,
							modified = true,
						},
					},
				},
				view = { side = "right" },
			})
		end,
	},
}
