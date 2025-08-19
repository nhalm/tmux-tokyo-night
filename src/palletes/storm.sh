#!/usr/bin/env bash

#Tokyo Night Storm Pallet
function get_palette_color() {
  local color_key="$1"
  case "$color_key" in
    none) echo "NONE" ;;
    bg_dark) echo "#1f2335" ;;
    bg) echo "#24283b" ;;
    bg_highlight) echo "#292e42" ;;
    terminal_black) echo "#414868" ;;
    fg) echo "#c0caf5" ;;
    fg_dark) echo "#a9b1d6" ;;
    fg_gutter) echo "#3b4261" ;;
    dark3) echo "#545c7e" ;;
    comment) echo "#565f89" ;;
    dark5) echo "#737aa2" ;;
    blue0) echo "#3d59a1" ;;
    blue) echo "#7aa2f7" ;;
    cyan) echo "#7dcfff" ;;
    blue1) echo "#2ac3de" ;;
    blue2) echo "#0db9d7" ;;
    blue5) echo "#89ddff" ;;
    blue6) echo "#b4f9f8" ;;
    blue7) echo "#394b70" ;;
    magenta) echo "#bb9af7" ;;
    magenta2) echo "#ff007c" ;;
    purple) echo "#9d7cd8" ;;
    orange) echo "#ff9e64" ;;
    yellow) echo "#e0af68" ;;
    green) echo "#9ece6a" ;;
    green1) echo "#73daca" ;;
    green2) echo "#41a6b5" ;;
    teal) echo "#1abc9c" ;;
    red) echo "#f7768e" ;;
    red1) echo "#db4b4b" ;;
    white) echo "#ffffff" ;;
    *) echo "" ;;
  esac
}

export -f get_palette_color
