return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason").setup()
			local lsp_config = require("lspconfig")

			-- blink-cmp
			local blink_capabilities = require("blink.cmp").get_lsp_capabilities()

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lsp_config[server_name].setup({ capabilities = blink_capabilities })
				end,
			})

			-- for pyright
			lsp_config.pyright.setup({
				settings = {
					pyright = {
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
						},
					},
				},
			})

			-- for deno
			lsp_config.denols.setup({
				root_dir = lsp_config.util.root_pattern("deno.json", "deno.jsonc"),
			})
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
			local util = require("conform.util")
			conform.setup({
				formatters_by_ft = {
					c = { "clang-format" },
					cpp = { "clang-format" },
					lua = { "stylua" },
					python = { "ruff" },
					go = { "gofumpt", "goimports" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					markdown = { "prettier" },
				},
			})
			conform.formatters["clang-format"] = {
				prepend_args = { "-style", "Microsoft" },
			}
			conform.formatters["ruff"] = { command = "ruff format" }
			conform.formatters["prettier"] = {
				cwd = util.root_file({ "package.json" }),
				require_cwd = true,
			}
			conform.formatters["denols"] = {
				cwd = util.root_file({ "deno.json", "deno.jsonc" }),
				command = "deno fmt",
				require_cwd = true,
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
				python = { "ruff" },
				go = { "golangcilint" },
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
