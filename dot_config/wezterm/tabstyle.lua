local wezterm = require("wezterm")

local M = {}

function M.apply(config)
	config.window_decorations = "RESIZE"
	config.use_fancy_tab_bar = true
	config.hide_tab_bar_if_only_one_tab = false

	config.window_frame = {
		font = wezterm.font({ family = "Roboto", weight = "Bold" }),
		font_size = 12.0,
		active_titlebar_bg = "#333333",
		inactive_titlebar_bg = "#333333",
	}

	config.colors = config.colors or {}
	config.colors.tab_bar = config.colors.tab_bar or {}

	config.colors.tab_bar.active_tab = {
		bg_color = "#272E33",
		fg_color = "#ffffff",
		intensity = "Bold",
		underline = "None",
		italic = false,
		strikethrough = false,
	}

	config.colors.tab_bar.inactive_tab = {
		fg_color = "#ffffff",
		bg_color = "#333333",
	}

	config.colors.tab_bar.inactive_tab_edge = "#575757"

	return config
end

return M
