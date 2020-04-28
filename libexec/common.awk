BEGIN {
  # From https://misc.flogisoft.com/bash/tip_colors_and_formatting.
  fg_colors["blue"] = "34";
  fg_colors["default"] = "39";
  fg_colors["white"] = "97";

  bg_colors["red"] = "41";
  bg_colors["green"] = "42";
  bg_colors["magenta"] = "45";
  bg_colors["default"] = "49";
}

function red(s) {
  return "\033[0;31m" s "\033[0m"
}

function green(s) {
  return "\033[0;32m" s "\033[0m"
}

function white_on_green(s) {
  return "\033[37;102m" s "\033[0m"
}

function blue(s) {
  return "\033[0;34m" s "\033[0m"
}

function violet(s) {
  return "\033[0;35m" s "\033[0m"
}

function colored(fg, bg, s) {
  if (!fg) {
    fg = "default"
  }
  fg_color = fg_colors[fg]
  if (!bg) {
    bg = "default"
  }
  bg_color = bg_colors[bg]
  return "\033[" fg_color ";" bg_color "m" s "\033[0m"
}
