require("which-key").add({
	{
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

			require("which-key").add({
				{
					{ "<Space>lI", "<CMD>Mason<CR>", desc = "Installer Info" },
					{ "<Space>li", "<CMD>LspInfo<CR>", desc = "Info" },
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					c = { "clang-format" },
					cpp = { "clang-format" },
					lua = { "stylua" },
					python = { "isort", "black" },
					go = { "gofumpt", "goimports" },
					javascript = { "prettier" },
					typescript = { "prettier" },
				},
			})
			conform.formatters["clang-format"] = {
				prepend_args = { "-style", "Microsoft" },
			}
			require("which-key").add({
				{
					{
						"<Space>lf",
						function()
							conform.format({
								async = true,
								lsp_format = "fallback",
							})
						end,
						desc = "Format",
					},
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				python = { "pylint", "flake8" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("Comment").setup()
		end,
	},
}
