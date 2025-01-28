local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- font
config.font = wezterm.font({
	family = "ShureTechMono Nerd Font",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 20

-- tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- coloerscheme
config.color_scheme = "Kanagawa (Gogh)"


return config
