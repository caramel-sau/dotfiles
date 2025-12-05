local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Configure
config.automatically_reload_config = true
config.color_scheme = 'iceberg-dark'
config.font = wezterm.font('PlemolJP Console NF')
config.font_size = 15
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.colors = {
  tab_bar = {
    background = 'none',
  },
}
config.window_background_gradient = {
  colors = { '#000000' },
}
config.show_new_tab_button_in_tab_bar = false
config.adjust_window_size_when_changing_font_size = false

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#0b0022'
    local background = '#1b1032'
    local foreground = '#808080'

    if tab.is_active then
      background = '#4e7272'
      foreground = '#ffffff'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

-- Keybind
config.leader = { key = 'j', mods = 'CTRL', timeout_milliseconds = 1000 }
local act = wezterm.action
config.keys = {
  {
    mods = 'LEADER',
    key = '[',
    action = act.ActivateCopyMode,
  },
  {
    mods = 'LEADER',
    key = '\\',
    action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
  {
    mods = 'LEADER',
    key = '-',
    action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },
  {
    mods = 'LEADER',
    key = 'h',
    action = act.ActivatePaneDirection('Left'),
  },
  {
    mods = 'LEADER',
    key = 'j',
    action = act.ActivatePaneDirection('Down'),
  },
  {
    mods = 'LEADER',
    key = 'k',
    action = act.ActivatePaneDirection('Up'),
  },
  {
    mods = 'LEADER',
    key = 'l',
    action = act.ActivatePaneDirection('Right'),
  },
  {
    mods = 'LEADER',
    key = 'r',
    action = act.ActivateKeyTable({
      name = 'resize_pane',
      one_shot = false,
    }),
  },
}
config.key_tables = {
  resize_pane = {
    {
      key = 'h',
      action = act.AdjustPaneSize({ 'Left', 1 }),
    },
    {
      key = 'H',
      action = act.AdjustPaneSize({ 'Left', 10 }),
    },
    {
      key = 'j',
      action = act.AdjustPaneSize({ 'Down', 1 }),
    },
    {
      key = 'J',
      action = act.AdjustPaneSize({ 'Down', 10 }),
    },
    {
      key = 'k',
      action = act.AdjustPaneSize({ 'Up', 1 }),
    },
    {
      key = 'K',
      action = act.AdjustPaneSize({ 'Up', 10 }),
    },
    {
      key = 'l',
      action = act.AdjustPaneSize({ 'Right', 1 }),
    },
    {
      key = 'L',
      action = act.AdjustPaneSize({ 'Right', 10 }),
    },
    -- Cancel the mode
    {
      key = 'Escape',
      action = 'PopKeyTable',
    },
  }
}

return config
