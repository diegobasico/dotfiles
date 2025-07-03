-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where helper files are called.
require("tabstyle").apply(config)

-- This is where you actually apply your config choices.
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 10

config.initial_cols = 128
config.initial_rows = 32

config.color_scheme = "Everforest Dark (Gogh)"

config.audible_bell = "Disabled"
config.hide_tab_bar_if_only_one_tab = true

-- Finally, return the configuration to wezterm:
return config
