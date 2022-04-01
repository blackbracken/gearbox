local wezterm = require "wezterm";

return {
  font = wezterm.font_with_fallback({
    "Jetbrains Mono",
    "Hiragino Sans",
  }),
  use_ime = true,
  font_size = 12.0,
  color_scheme = "MaterialDarker",
  default_cursor_style = "BlinkingBar",
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 0.95,
}
