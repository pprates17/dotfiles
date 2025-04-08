local wezterm = require 'wezterm'
local ss = require 'smart_splits'
local session_manager = require 'session-manager'
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.enable_wayland = false
-- Appearance
config.color_scheme = 'Kanagawa (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
    
workspace_switcher.apply_to_config(config)
wezterm.on('update-right-status', function(window, pane)
    window:set_right_status(window:active_workspace())
end)

-- Keybinds
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
    { key = '=', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }},
    { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }},
    { key = 'w', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true }},
    -- Tabs
    { key = 't', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain')},
    { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1)},
    { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1)},
    { key = '1', mods = 'CTRL', action = act.ActivateTab(0)},
    { key = '2', mods = 'CTRL', action = act.ActivateTab(1)},
    { key = '3', mods = 'CTRL', action = act.ActivateTab(2)},
    { key = '4', mods = 'CTRL', action = act.ActivateTab(3)},
    { key = '5', mods = 'CTRL', action = act.ActivateTab(4)},
    { key = '6', mods = 'CTRL', action = act.ActivateTab(5)},
    { key = '7', mods = 'CTRL', action = act.ActivateTab(6)},
    { key = '8', mods = 'CTRL', action = act.ActivateTab(7)},
    { key = '9', mods = 'CTRL', action = act.ActivateTab(8)},
    { key = 'v', mods = 'LEADER', action = act.ActivateCopyMode},
    { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState},
    { key = 'Space', mods = 'LEADER', action = act.RotatePanes 'Clockwise'},
    { key = '0', mods = 'LEADER', action = act.PaneSelect {mode = 'SwapWithActive'}},
    { key = ',', mods = 'LEADER', action = act.PromptInputLine {
          description = 'Tab name',
          action = wezterm.action_callback(
            function(window, pane, line)
              if line then
                window:active_tab():set_title(line)
              end
            end
          ),
        },
    },
    { key = 'i', mods = 'LEADER', action = act.SwitchToWorkspace },
    { key = '.', mods = 'LEADER', action = act.PromptInputLine {
          description = 'Workspace name',
          action = wezterm.action_callback(
            function(window, pane, line)
              if line then
		wezterm.mux.rename_workspace(
		    wezterm.mux.get_active_workspace(),
			line	
		)
              end
            end
          ),
        },
    },
    --Smart split functions
    ss.split_nav('move', 'h'),
    ss.split_nav('move', 'j'), 
    ss.split_nav('move', 'k'),
    ss.split_nav('move', 'l'),
    ss.split_nav('resize', 'h'),
    ss.split_nav('resize', 'j'),
    ss.split_nav('resize', 'k'),
    ss.split_nav('resize', 'l'),
    { key = "s", mods = "LEADER", action = workspace_switcher.switch_workspace()},
    { key = "S", mods = "LEADER", action = workspace_switcher.switch_to_prev_workspace()},
    { key = "w", mods = "ALT", action = wezterm.action_callback(function(win, pane)
        resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
      end),
    },
    { key = "W", mods = "ALT", action = resurrect.window_state.save_window_action()},
    { key = "T", mods = "ALT", action = resurrect.tab_state.save_tab_action()},
    { key = "s", mods = "ALT", action = wezterm.action_callback(function(win, pane)
	resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
        resurrect.window_state.save_window_action()
	end)
    },
    {
    key = "r",
    mods = "ALT",
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
        local type = string.match(id, "^([^/]+)") -- match before '/'
        id = string.match(id, "([^/]+)$") -- match after '/'
        id = string.match(id, "(.+)%..+$") -- remove file extention
        local opts = {
	    close_open_tabs = true,
	    close_open_panes = true,
	    window = pane:window(),
  	    on_pane_restore = resurrect.tab_state.default_on_pane_restore,
  	    relative = true,
  	    restore_text = true,
        }
        if type == "workspace" then
	    local state = resurrect.state_manager.load_state(id, "workspace")
	    resurrect.workspace_state.restore_workspace(state, opts)
        elseif type == "window" then
	    local state = resurrect.state_manager.load_state(id, "window")
	    resurrect.window_state.restore_window(pane:window(), state, opts)
        elseif type == "tab" then
	    local state = resurrect.state_manager.load_state(id, "tab")
	    resurrect.tab_state.restore_tab(pane:tab(), state, opts)
        end
      end)
    end),
  },
}
return config
