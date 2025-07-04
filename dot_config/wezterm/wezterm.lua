local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Helper modules
require("tabstyle").apply(config)

-- Platform-specific overrides
if wezterm.target_triple:find("windows") then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
	config.default_cursor_style = "BlinkingBlock"
else
	config.hide_tab_bar_if_only_one_tab = true
end

-- General config
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 10
config.initial_cols = 128
config.initial_rows = 32
config.color_scheme = "Everforest Dark (Gogh)"
config.audible_bell = "Disabled"
config.window_decorations = "RESIZE"

return config
