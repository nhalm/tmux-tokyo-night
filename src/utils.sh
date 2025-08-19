#!/usr/bin/env bash

function get_tmux_option() {
	local option=$1
	local default_value=$2
	local -r option_value=$(tmux show-option -gqv "$option")

	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

function generate_left_side_string() {

	session_icon=$(get_tmux_option "@theme_session_icon" " ")
	left_separator=$(get_tmux_option "@theme_left_separator" "")
	transparent=$(get_tmux_option "@theme_transparent_status_bar" "false")

	if [ "$transparent" = "true" ]; then
		local separator_end="#[bg=default]#{?client_prefix,#[fg=$(get_palette_color yellow)],#[fg=$(get_palette_color green)]}${left_separator:?}#[none]"
	else
		local separator_end="#[bg=$(get_palette_color bg_highlight)]#{?client_prefix,#[fg=$(get_palette_color yellow)],#[fg=$(get_palette_color green)]}${left_separator:?}#[none]"
	fi

	echo "#[fg=$(get_palette_color fg_gutter),bold]#{?client_prefix,#[bg=$(get_palette_color yellow)],#[bg=$(get_palette_color green)]} ${session_icon} #S ${separator_end}"
}

function generate_inactive_window_string() {

	inactive_window_icon=$(get_tmux_option "@theme_plugin_inactive_window_icon" " ")
	zoomed_window_icon=$(get_tmux_option "@theme_plugin_zoomed_window_icon" " ")
	left_separator=$(get_tmux_option "@theme_left_separator" "")
	transparent=$(get_tmux_option "@theme_transparent_status_bar" "false")
	inactive_window_title=$(get_tmux_option "@theme_inactive_window_title" "#W ")

	if [ "$transparent" = "true" ]; then
		left_separator_inverse=$(get_tmux_option "@theme_transparent_left_separator_inverse" "")

		local separator_start="#[bg=default,fg=$(get_palette_color dark5)]${left_separator_inverse}#[bg=$(get_palette_color dark5),fg=$(get_palette_color bg_highlight)]"
		local separator_internal="#[bg=$(get_palette_color dark3),fg=$(get_palette_color dark5)]${left_separator:?}#[none]"
		local separator_end="#[bg=default,fg=$(get_palette_color dark3)]${left_separator:?}#[none]"
	else
		local separator_start="#[bg=$(get_palette_color dark5),fg=$(get_palette_color bg_highlight)]${left_separator:?}#[none]"
		local separator_internal="#[bg=$(get_palette_color dark3),fg=$(get_palette_color dark5)]${left_separator:?}#[none]"
		local separator_end="#[bg=$(get_palette_color bg_highlight),fg=$(get_palette_color dark3)]${left_separator:?}#[none]"
	fi

	echo "${separator_start}#[fg=$(get_palette_color white)]#I${separator_internal}#[fg=$(get_palette_color white)] #{?window_zoomed_flag,$zoomed_window_icon,$inactive_window_icon}${inactive_window_title}${separator_end}"
}

function generate_active_window_string() {

	active_window_icon=$(get_tmux_option "@theme_plugin_active_window_icon" " ")
	zoomed_window_icon=$(get_tmux_option "@theme_plugin_zoomed_window_icon" " ")
	pane_synchronized_icon=$(get_tmux_option "@theme_plugin_pane_synchronized_icon" "✵")
	left_separator=$(get_tmux_option "@theme_left_separator" "")
	transparent=$(get_tmux_option "@theme_transparent_status_bar" "false")
	active_window_title=$(get_tmux_option "@theme_active_window_title" "#W ")

	if [ "$transparent" = "true" ]; then
		left_separator_inverse=$(get_tmux_option "@theme_transparent_left_separator_inverse" "")
		
		separator_start="#[bg=default,fg=$(get_palette_color magenta)]${left_separator_inverse}#[bg=$(get_palette_color magenta),fg=$(get_palette_color bg_highlight)]"
		separator_internal="#[bg=$(get_palette_color purple),fg=$(get_palette_color magenta)]${left_separator:?}#[none]"
		separator_end="#[bg=default,fg=$(get_palette_color purple)]${left_separator:?}#[none]"
	else
		separator_start="#[bg=$(get_palette_color magenta),fg=$(get_palette_color bg_highlight)]${left_separator:?}#[none]"
		separator_internal="#[bg=$(get_palette_color purple),fg=$(get_palette_color magenta)]${left_separator:?}#[none]"
		separator_end="#[bg=$(get_palette_color bg_highlight),fg=$(get_palette_color purple)]${left_separator:?}#[none]"
	fi

	echo "${separator_start}#[fg=$(get_palette_color white)]#I${separator_internal}#[fg=$(get_palette_color white)] #{?window_zoomed_flag,$zoomed_window_icon,$active_window_icon}${active_window_title}#{?pane_synchronized,$pane_synchronized_icon,}${separator_end}#[none]"
}
