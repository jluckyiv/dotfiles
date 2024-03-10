-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Dracula (Official)"
config.window_background_opacity = 0.8

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 17.0

-- and finally, return the configuration to wezterm
return config
