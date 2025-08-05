-- Pull in the wezterm API
local wezterm = require 'wezterm'
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')

local config = wezterm.config_builder()

wezterm.font = 'FiraCode'
-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = 'Kanagawa (Gogh)'

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Keybindings
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    { key = 'a', mods = 'LEADER|CTRL', action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' }},
    { key = '-', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }},
    { key = '|', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }},
    { key = 'w', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true }},
    { key = 't', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain'},
    { key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },
    { key = 'p', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1)},
    { key = 'n', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1)},
}

-- Smart Splits config
smart_splits.apply_to_config(config, {
  direction_keys = { 'h', 'j', 'k', 'l' },
  modifiers = {
    move = 'CTRL',
    resize = 'ALT',
  },
  log_level = 'info',
})

return config
