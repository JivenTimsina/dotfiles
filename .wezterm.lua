-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- config starts here --

-- uncomment the line below if you're using wsl on windows
-- config.default_prog = { 'wsl.exe', '--cd', '~' }

-- color scheme
config.color_scheme = "Catppuccin Mocha"

-- disable header
config.window_decorations = "RESIZE"

-- use a normal tab bar
config.use_fancy_tab_bar = false

-- start index = 0
config.tab_and_split_indices_are_zero_based = true

-- show tab bar only when the new tab is created
config.hide_tab_bar_if_only_one_tab = true

-- tabs config
config.window_frame = {
	
	--tab font
	font = wezterm.font({ family = "Roboto", weight = "Light" }),
	
	-- The size of the font in the tab bar.
	font_size = 10.0,
	
	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#1e1e2e",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#1e1e2e",
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#1e1e2e",
	},
}

-- background image
config.window_background_image = "/home/jiventim/.dotfiles/underwater.png"
config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.6,

	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 1.0,

	-- You can adjust the saturation also.
	saturation = 1.0,
}

--window opacity. not useful while using background image
config.window_background_opacity = 1.0

--text background opacity
config.text_background_opacity = 0.8

--font
config.font = wezterm.font("JetBrains Mono NL", { weight = "Light" })
config.font_size = 12.0

-- and finally, return the configuration to wezterm
return config