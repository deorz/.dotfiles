local wezterm = require("wezterm")

local config = wezterm.config_builder()

local mux = wezterm.mux

local opacity = 0.75

config = {
	color_scheme = "Tokyo Night",
	window_background_opacity = opacity,
	macos_window_background_blur = 0,
	default_cursor_style = "SteadyBlock",
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	font_size = 14,
	font = wezterm.font("Liga SFMono Nerd Font", {
		weight = "Bold",
		stretch = "Normal",
		style = "Normal",
	}),
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,
	scrollback_lines = 10000,
	window_padding = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	},
	colors = {
		tab_bar = {
			background = "rgba(26 27 38 " .. opacity .. ")",
			inactive_tab_edge = "rgba(22 22 30 " .. opacity .. ")",
			active_tab = {
				bg_color = "rgba(26 27 38 " .. opacity .. ")",
				fg_color = "rgba(122 162 255 1.0)",
			},
			inactive_tab = {
				fg_color = "rgba(84 92 126 1.0)",
				bg_color = "rgba(26 27 38 " .. opacity .. ")",
			},
		},
	},

	leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
		{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
		{ key = "LeftArrow", mods = "SUPER", action = wezterm.action({ SendString = "\x01" }) },
		{ key = "RightArrow", mods = "SUPER", action = wezterm.action({ SendString = "\x05" }) },
		{ key = "Backspace", mods = "SUPER", action = wezterm.action({ SendString = "\x15" }) },
		{ key = "z", mods = "SUPER", action = wezterm.action({ SendString = "\x1f" }) },

		{ key = '"', mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "%", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
		{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		{
			key = ",",
			mods = "LEADER",
			action = wezterm.action.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			key = "s",
			mods = "LEADER",
			action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
		},
		{
			key = "$",
			mods = "LEADER|SHIFT",
			action = wezterm.action.PromptInputLine({
				description = "Enter new name for session",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						mux.rename_workspace(window:mux_window():get_workspace(), line)
					end
				end),
			}),
		},

		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },

		{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	},
}

local create_work_workspace = function()
	local project_dir = wezterm.home_dir .. "/Work"
	local tab, _, window = mux.spawn_window({
		cwd = project_dir,
		workspace = "Work",
	})
	tab:set_title("Code")
	for _, name in ipairs({ "Docker", "Other", "Kubernetes", "Files" }) do
		local tab, _, _ = window:spawn_tab({})
		tab:set_title(name)
	end
end

local create_dotfiles_workspace = function()
	local project_dir = wezterm.home_dir .. "/.dotfiles"
	local tab, _, window = mux.spawn_window({
		cwd = project_dir,
		workspace = "Dotfiles",
	})
	tab:set_title("Dotfiles")
	for _, name in ipairs({ "Neovim" }) do
		local tab, _, _ = window:spawn_tab({})
		tab:set_title(name)
	end
end

wezterm.on("gui-startup", function(cmd)
	create_work_workspace()
	create_dotfiles_workspace()

	mux.spawn_window(cmd or {})
end)

return config
