local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	color_scheme = "Tokyo Night",
	window_background_opacity = 0.7,
	macos_window_background_blur = 0,
	default_cursor_style = "BlinkingBar",
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	font_size = 14,
	font = wezterm.font("SFMono Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	enable_tab_bar = false,
	scrollback_lines = 10000,
	window_padding = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	},
	keys = {
		{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
		{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
		{ key = "LeftArrow", mods = "SUPER", action = wezterm.action({ SendString = "\x01" }) },
		{ key = "RightArrow", mods = "SUPER", action = wezterm.action({ SendString = "\x05" }) },
		{ key = "Backspace", mods = "SUPER", action = wezterm.action({ SendString = "\x15" }) },
	},
}

return config
