local set = vim.keymap.set

return {
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lspsaga").setup({
				ui = { code_action = "" },
				symbol_in_winbar = {
					-- enable = false,
					color_mode = false,
				},
			})
			set("n", "<Space>ca", "<Cmd>Lspsaga code_action<CR>", { desc = "[C]ode [A]ction" })
			set("n", "<Space>cd", "<Cmd>Lspsaga peek_definition<CR>", { desc = "[C]ode [D]efinition" })
			set("n", "<Space>cf", "<Cmd>Lspsaga finder ref+def<CR>", { desc = "[C]ode [F]inder" })
			set("n", "<Space>ci", "<Cmd>Lspsaga finder imp<CR>", { desc = "[C]ode [I]mplementation" })
			set("n", "<Space>cj", "<Cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "[C]ode [N]ext Diagnostics" })
			set("n", "<Space>ck", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "[C]ode [P]rev Diagnostics" })
			set("n", "<Space>co", "<Cmd>Lspsaga outline<CR>", { desc = "[C]ode [O]utline" })
			set("n", "<Space>cr", "<Cmd>Lspsaga rename<CR>", { desc = "[C] [R]ename" })
			set("n", "<Space>dc", "<Cmd>Lspsaga show_cursor_diagnostics<Cr>", { desc = "[D]iagnostic [C]ursor" })
			set("n", "<Space>dl", "<Cmd>Lspsaga show_line_diagnostics<Cr>", { desc = "[D]iagnostic [L]ine" })
			require("which-key").add({
				{
					{ "<Space>c", group = "code" },
					{ "<Space>d", group = "diagnostics" },
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("nvim-treesitter.configs").setup({
				build = "TSUpdate",
				ensure_installed = { "lua", "markdown" },
				ignore_install = { "org" },
				sync_install = false,
				auto_install = false,
				highlight = {
					enable = true,
					disable = function(_, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
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
			set("n", "zR", ufo.openAllFolds)
			set("n", "zM", ufo.closeAllFolds)
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
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		opts = {
			render_modes = { "n", "c", "t" },
		},
		config = function()
			require("render-markdown").setup({
				completions = { lsp = { enabled = true } },
			})
		end,
	},
}
