local wezterm = require("wezterm")

-- local
local fonts = {
	-- latin_font_family = "ComicShannsMono Nerd Font Propo",
	-- latin_font_family = "DepartureMono Nerd Font Propo",
	-- latin_font_family = "FantasqueSansM Nerd Font Propo",
	-- latin_font_family = "IosevkaTerm Nerd Font Propo",
	-- latin_font_family = "JetBrainsMono Nerd Font Propo",
	-- latin_font_family = "GoMono Nerd Font Propo",
	-- latin_font_family = "UbuntuMono Nerd Font Propo",
	latin_font_family = "ZedMono Nerd Font Propo",
	zh_font_family = "DFKai-SB",
	-- zh_font_family = "Chenyuluoyan",
	font_size = 22,
}

return {
	font = wezterm.font_with_fallback({
		{
			family = fonts.latin_font_family,
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},
		{
			family = fonts.zh_font_family,
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},
	}),
	font_size = fonts.font_size,
	font_rules = {
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font_with_fallback({
				{
					family = fonts.latin_font_family,
					weight = "Bold",
				},
				{
					family = fonts.zh_font_family,
					weight = "Bold",
				},
			}),
		},
		{
			intensity = "Half",
			italic = true,
			font = wezterm.font_with_fallback({
				{
					family = fonts.latin_font_family,
					weight = "Thin",
					italic = true,
				},
				{
					family = fonts.zh_font_family,
					weight = "Thin",
					italic = true,
				},
			}),
		},
	},

	-- tab bar
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	enable_tab_bar = false,

	-- window
	window_decorations = "RESIZE", -- remove title bar

	max_fps = 120,

	-- color_scheme options
	-- color_scheme = "Tokyo Night Storm",
	-- color_scheme = "Gruvbox dark, hard (base16)"
	-- color_scheme = "Kanagawa (Gogh)",
	color_scheme = "rose-pine",
}
