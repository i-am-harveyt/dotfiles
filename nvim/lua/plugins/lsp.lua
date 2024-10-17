require("which-key").add({
	{
		{ "<Space>l",  group = "LSP" },
		{ "<Space>lD", "<cmd>Telescope diagnostics<cr>",                   desc = "Document Diagnostics" },
		{ "<Space>lI", "<cmd>Mason<cr>",                                   desc = "Installer Info" },
		{ "<Space>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",           desc = "Code Action" },
		{ "<Space>ld", "<Cmd>lua vim.lsp.buf.definition()<CR>",            desc = "Definition" },
		{ "<Space>lf", "<Cmd>lua vim.lsp.buf.format { async = true }<CR>", desc = "Format" },
		{ "<Space>lh", "<Cmd>lua vim.lsp.buf.hover()<CR>",                 desc = "hover" },
		{ "<Space>li", "<cmd>LspInfo<cr>",                                 desc = "Info" },
		{ "<Space>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",      desc = "Next Diagnostic" },
		{ "<Space>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",      desc = "Prev Diagnostic" },
		{ "<Space>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",              desc = "CodeLens Action" },
		{ "<Space>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",    desc = "Quickfix" },
		{ "<Space>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                desc = "Rename" },
		{ "<Space>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>",     desc = "Workspace Diagnostics" },
	},
})

return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local mason = require("mason")
			mason.setup()
			local mason_config = require("mason-lspconfig")
			local lsp_config = require("lspconfig")

			-- cmp_nvim_lsp
			local cmp = require("cmp_nvim_lsp")
			local capabilities = cmp.default_capabilities()

			mason_config.setup_handlers({
				function(server_name)
					lsp_config[server_name].setup({ capabilities = capabilities })
				end,
			})

			-- for deno
			lsp_config.denols.setup({ root_dir = lsp_config.util.root_pattern("deno.json", "deno.jsonc") })
			lsp_config.ts_ls.setup({
				root_dir = lsp_config.util.root_pattern("package.json"),
				single_file_support = false,
			})

			-- for efm (linter & formatter)
			local black = require("efmls-configs.formatters.black")
			local isort = require("efmls-configs.formatters.isort")
			local flake8 = require("efmls-configs.linters.flake8")
			local pylint = require("efmls-configs.linters.pylint")
			local prettier = require("efmls-configs.formatters.prettier")
			local stylua = require("efmls-configs.formatters.stylua")
			local rustfmt = require("efmls-configs.formatters.rustfmt")
			local lang = {
				markdown = { prettier },
				python = { black, isort, flake8, pylint },
				lua = { stylua },
				rust = { rustfmt },
			}
			lsp_config.efm.setup({
				capabilities = capabilities,
				init_options = { documentFormatting = true, documentRangeFormatting = true },
				settings = { rootMarkers = { ".git/" }, languages = lang },
			})
		end,
	},
	{
		"creativenull/efmls-configs-nvim",
		-- version = 'v1.x.x', -- version is optional, but recommended
		event = "InsertEnter",
		dependencies = { "neovim/nvim-lspconfig" },
	},
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("Comment").setup()
		end,
	},
}
