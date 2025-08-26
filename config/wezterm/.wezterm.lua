local wezterm = require "wezterm";
local act = wezterm.action;
return {
  font = wezterm.font_with_fallback {
    "Jetbrains Mono",
    "Hiragino Sans",
  },
  use_ime = true,
  font_size = 13.0,
  color_scheme = "Molokai",
  default_cursor_style = "BlinkingBar",
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 16,
    bottom = 0,
  },
  window_close_confirmation = "NeverPrompt",
  set_environment_variables = {
    LANG = "ja_JP.UTF-8",
  },
}
