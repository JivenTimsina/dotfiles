-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- config starts here --

-- Enable wayland support explicitly
config.enable_wayland = true

config.color_scheme = "nord"

-- disable header
config.window_decorations = "NONE"

-- use a normal tab bar
config.use_fancy_tab_bar = false

-- start index = 0
config.tab_and_split_indices_are_zero_based = true

-- show tab bar only when a new tab is created
config.hide_tab_bar_if_only_one_tab = true

config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
	left = 8,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_background_opacity = 1.0

--text background opacity
config.text_background_opacity = 1.0

--font settings
config.font = wezterm.font("JetBrains Mono NL")
config.font_size = 17

config.default_cursor_style = "SteadyUnderline"

-- multiplexer
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{
		--open a new tab
		mods = "LEADER",
		key = "t",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		cwd = wezterm.home_dir,
	},
	{
		--close the current tab
		mods = "LEADER",
		key = "d",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		--activate previous tab
		mods = "LEADER",
		key = "b",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		--activate next tab
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		--vertical split
		mods = "LEADER",
		key = "/",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		--horizontal split
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		--activate split left
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		--activate split right
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		--activate split up
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		--activate split down
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		--resize left
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		--resize right
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		--resize up
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		--resize down
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
}

-- activate tab using the tab number
for i = 0, 9 do
	table.insert(config.keys, {
		mods = "LEADER",
		key = tostring(i),
		action = wezterm.action.ActivateTab(i),
	})
end

-- and finally, return the configuration to wezterm
return config
