return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<C-j>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
			},
			cmdline = {
				keymap = {
					["<CR>"] = { "accept_and_enter", "fallback" },
				},
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },
		},
	},
}
