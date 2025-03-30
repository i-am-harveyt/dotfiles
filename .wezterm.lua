local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- local
local font = {
	-- font_family = "DepartureMono Nerd Font Propo",
	-- font_family = "FantasqueSansM Nerd Font Propo",
	font_family = "ComicShannsMono Nerd Font Propo",
	font_size = 22,
}

config = {

	-- font
	font = wezterm.font({
		family = font.font_family,
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	}),
	font_size = font.font_size,
	font_rules = {
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font(font.font_family, { weight = "Bold", stretch = "Normal", style = "Normal" }),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font(font.font_family, { weight = "Bold", stretch = "Normal", style = "Italic" }),
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
	color_scheme = "Kanagawa (Gogh)",
}

return config
