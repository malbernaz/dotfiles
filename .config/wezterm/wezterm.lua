local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 13
config.color_scheme = "tokyonight"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.window_decorations = "RESIZE"

config.use_fancy_tab_bar = false
config.tab_max_width = 24
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = "#222436",
      fg_color = "#c8d3f5",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#1a1b26",
      fg_color = "#545c7e",
    },
  },
}

wezterm.on("update-right-status", function(window)
  local date = wezterm.strftime("%H:%M %d/%m/%Y")

  window:set_right_status(wezterm.format({ { Text = date .. " " } }))
end)

config.keys = {
  {
    key = "d",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "d",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
}

local smart_splits =
  wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

smart_splits.apply_to_config(config)

return config
