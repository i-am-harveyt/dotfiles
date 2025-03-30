local set = vim.keymap.set

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()

			set("n", "<Space>lI", "<CMD>Mason<CR>", { desc = "[L]SP [I]nstaller" })
			set("n", "<Space>li", "<CMD>LspInfo<CR>", { desc = "[L]SP [I]nfo" })
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
					typst = { "prettypst" },
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
			set("n", "<Space>lf", function()
				conform.format({
					async = true,
					lsp_format = "fallback",
				})
			end, { desc = "Format" })
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
	{ -- work for neovim
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
