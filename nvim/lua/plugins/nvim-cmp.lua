local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

local config = function()
	local cmp_ok, cmp = pcall(require, "cmp")
	if not cmp_ok then
		print("CMP not ok")
		return
	end
	local ls_ok, ls = pcall(require, "luasnip")
	if not ls_ok then
		print("luasnip not ok")
		return
	end
	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		experimental = {
			ghost_text = { hl_group = "Comment" },
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
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
			end,
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
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if ls.locally_jumpable(-1) then
					ls.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		snippet = {
			expand = function(args)
				ls.lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "codeium" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
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
