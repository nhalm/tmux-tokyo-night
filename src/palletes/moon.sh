#!/usr/bin/env bash

#Tokyo Night Moon Pallet
function get_palette_color() {
  local color_key="$1"
  case "$color_key" in
    none) echo "NONE" ;;
    bg_dark) echo "#1e2030" ;;
    bg) echo "#222436" ;;
    bg_highlight) echo "#2f334d" ;;
    terminal_black) echo "#444a73" ;;
    fg) echo "#c8d3f5" ;;
    fg_dark) echo "#828bb8" ;;
    fg_gutter) echo "#3b4261" ;;
    dark3) echo "#545c7e" ;;
    comment) echo "#7a88cf" ;;
    dark5) echo "#737aa2" ;;
    blue0) echo "#3e68d7" ;;
    blue) echo "#82aaff" ;;
    cyan) echo "#86e1fc" ;;
    blue1) echo "#65bcff" ;;
    blue2) echo "#0db9d7" ;;
    blue5) echo "#89ddff" ;;
    blue6) echo "#b4f9f8" ;;
    blue7) echo "#394b70" ;;
    purple) echo "#fca7ea" ;;
    magenta2) echo "#ff007c" ;;
    magenta) echo "#c099ff" ;;
    orange) echo "#ff966c" ;;
    yellow) echo "#ffc777" ;;
    green) echo "#c3e88d" ;;
    green1) echo "#4fd6be" ;;
    green2) echo "#41a6b5" ;;
    teal) echo "#4fd6be" ;;
    red) echo "#ff757f" ;;
    red1) echo "#c53b53" ;;
    white) echo "#ffffff" ;;
    *) echo "" ;;
  esac
}

export -f get_palette_color
