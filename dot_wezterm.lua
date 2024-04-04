local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
		-- return "Tokyo Night"
	else
		-- return "Catppuccin Latte"
		-- return "Catppuccin Mocha"
		-- return "Tokyo Night Day"
		return "Tokyo Night"
	end
end
-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.9

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 17.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- and finally, return the configuration to wezterm
return config
