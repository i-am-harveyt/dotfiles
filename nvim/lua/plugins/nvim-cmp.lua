local format_func = function(entry, vim_item)
	local kind = require("lspkind").cmp_format({
		mode = "symbol_text",
		maxwidth = 50,
		ellipsis_char = "...",
		symbol_map = { Codeium = "" },
	})(entry, vim_item)
	local strings = vim.split(kind.kind, "%s", { trimempty = true })
	kind.kind = " " .. (strings[1] or "") .. " "
	kind.menu = "    (" .. (strings[2] or "") .. ")"

	return kind
end

local config = function()
	local cmp = require("cmp")
	local ls = require("luasnip")

	cmp.setup({
		experimental = { ghost_text = { hl_group = "Comment" } },
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = format_func,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-u>"] = cmp.mapping.scroll_docs(-1),
			["<C-d>"] = cmp.mapping.scroll_docs(1),
			["<C-CR>"] = cmp.mapping.complete(),
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					if ls.expandable() then
						ls.expand()
					else
						cmp.confirm({
							select = true,
						})
					end
				else
					fallback()
				end
			end),

			["<Tab>"] = cmp.mapping(function(fallback)
				if ls.locally_jumpable(1) then
					ls.jump(1)
				else
					fallback()
				end
			end, { "i" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if ls.locally_jumpable(-1) then
					ls.jump(-1)
				else
					fallback()
				end
			end, { "i" }),
		}),
		snippet = {
			expand = function(args)
				ls.lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "codeium" },
			{ name = "nvim_lsp" },
			{ name = "buffer" },
		}),
		window = {
			completion = {
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				col_offset = -3,
				side_padding = 0,
			},
		},
	})
end

return {
	{
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = config,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
}
