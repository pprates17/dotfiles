local wezterm = require 'wezterm'
local ss = require 'smart_splits'
local act = wezterm.action
local config = wezterm.config_builder()

-- Appearance
config.color_scheme = 'Kanagawa (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"
config.use_fancy_tab_bar = false

-- Keybinds
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
    { key = '=', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }},
    { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }},
    { key = 'w', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true }},
    { key = 't', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain')},
    { key = '1', mods = 'CTRL', action = act.ActivateTab(0)},
    { key = '2', mods = 'CTRL', action = act.ActivateTab(1)},
    { key = '3', mods = 'CTRL', action = act.ActivateTab(2)},
    { key = '4', mods = 'CTRL', action = act.ActivateTab(3)},
    { key = '5', mods = 'CTRL', action = act.ActivateTab(4)},
    { key = '6', mods = 'CTRL', action = act.ActivateTab(5)},
    { key = '7', mods = 'CTRL', action = act.ActivateTab(6)},
    { key = '8', mods = 'CTRL', action = act.ActivateTab(7)},
    { key = '9', mods = 'CTRL', action = act.ActivateTab(8)},
    
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
