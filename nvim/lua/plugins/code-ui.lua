return {
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lspsaga").setup({ ui = { code_action = "" } })
			require("which-key").add({
				{
					{ "<Space>c",  group = "code" },
					{ "<Space>ca", "<Cmd>Lspsaga code_action<CR>",             desc = "action" },
					{ "<Space>cd", "<Cmd>Lspsaga peek_definition<CR>",         desc = "definition" },
					{ "<Space>cf", "<Cmd>Lspsaga lsp_finder<CR>",              desc = "find" },
					{ "<Space>ch", "<Cmd>Lspsaga hover_doc<CR>",               desc = "hover" },
					{ "<Space>ci", "<Cmd>Lspsaga finder imp<CR>",              desc = "implementation" },
					{ "<Space>cj", "<Cmd>Lspsaga diagnostic_jump_next<CR>",    desc = "next_diagnostics" },
					{ "<Space>ck", "<Cmd>Lspsaga diagnostic_jump_prev<CR>",    desc = "prev_diagnostics" },
					{ "<Space>co", "<Cmd>Lspsaga outline<CR>",                 desc = "outline" },
					{ "<Space>cr", "<Cmd>Lspsaga rename<CR>",                  desc = "rename" },
					{ "<Space>d",  group = "diagnostics" },
					{ "<Space>dc", "<Cmd>Lspsaga show_cursor_diagnostics<Cr>", desc = "cursor" },
					{ "<Space>dl", "<Cmd>Lspsaga show_line_diagnostics<Cr>",   desc = "line" },
					{ "<Space>h",  "<Cmd>Lspsaga hover_doc<CR>",               desc = "hover" },
					{ "<Space>t",  "<Cmd>Lspsaga term_toggle<CR>",             desc = "terminal" },
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			local ibl = require("ibl")
			ibl.setup()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup({ scope = { highlight = highlight } })

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("nvim-treesitter.configs").setup({
				build = "TSUpdate",
				ensure_installed = { "lua" },
				ignore_install = { "org" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					disable = { "org" },
					additional_vim_regex_highlighting = { "org" },
				},
				incremental_selection = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			local ufo = require("ufo")
			vim.keymap.set("n", "zR", ufo.openAllFolds)
			vim.keymap.set("n", "zM", ufo.closeAllFolds)
			ufo.setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
