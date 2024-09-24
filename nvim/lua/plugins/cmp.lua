local config = function()
	local cmp = require("cmp")
	local ls = require("luasnip")

	cmp.setup({
		experimental = { ghost_text = { hl_group = "Comment" } },
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
						cmp.confirm({ select = true })
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
		sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "buffer" } }),
	})
end

return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
		config = config,
	},
	{ "L3MON4D3/LuaSnip", version = "v2.*" },
}
