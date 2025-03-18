local wezterm = require 'wezterm'
local ss = require 'smart_splits'
local act = wezterm.action
local config = wezterm.config_builder()

-- Appearance
config.color_scheme = 'Kanagawa (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- Keybinds
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
	{ key = '=', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }},
	{ key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }},
	{ key = 'w', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true }},
	{ key = 't', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain')},

	-- Smart split functions
	ss.split_nav('move', 'h'),
	ss.split_nav('move', 'j'),
	ss.split_nav('move', 'k'),
	ss.split_nav('move', 'l'),
	ss.split_nav('resize', 'h'),
    	ss.split_nav('resize', 'j'),
    	ss.split_nav('resize', 'k'),
    	ss.split_nav('resize', 'l'),
}

return config
