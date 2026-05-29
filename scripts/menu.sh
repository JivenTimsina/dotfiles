#!/usr/bin/env bash

# Application launcher for Sway WM using fzf
# Searches .desktop files from standard XDG application directories
# Usage: bind this script to a key in your sway config
#   bindsym $mod+d exec ~/path/to/applauncher.sh

# XDG application directories
APP_DIRS=(
    "/usr/share/applications"
    "/usr/local/share/applications"
    "$HOME/.local/share/applications"
    "/var/lib/flatpak/exports/share/applications"
    "$HOME/.local/share/flatpak/exports/share/applications"
)

# ── Parse .desktop files ─────────────────────────────────────────────────────

declare -A APP_CMDS
declare -A APP_ICONS
declare -A APP_DESCS

parse_desktop_files() {
    for dir in "${APP_DIRS[@]}"; do
        [[ -d "$dir" ]] || continue
        while IFS= read -r -d '' file; do
            # Skip files that are hidden or have NoDisplay=true / OnlyShowIn
            grep -q "^NoDisplay=true" "$file" && continue
            grep -q "^Hidden=true"    "$file" && continue

            name=$(grep -m1 "^Name="    "$file" | cut -d= -f2-)
            exec=$(grep -m1 "^Exec="   "$file" | cut -d= -f2-)
            icon=$(grep -m1 "^Icon="   "$file" | cut -d= -f2-)
            desc=$(grep -m1 "^Comment=" "$file" | cut -d= -f2-)

            [[ -z "$name" || -z "$exec" ]] && continue

            # Strip field codes (%u %U %f %F %i %c %k etc.)
            exec=$(echo "$exec" | sed 's/ %[a-zA-Z]//g')

            APP_CMDS["$name"]="$exec"
            APP_ICONS["$name"]="$icon"
            APP_DESCS["$name"]="$desc"
        done < <(find "$dir" -maxdepth 1 -name "*.desktop" -print0 2>/dev/null)
    done
}

# ── Build display list ────────────────────────────────────────────────────────

build_menu() {
    for name in $(printf '%s\n' "${!APP_CMDS[@]}" | sort -f); do
        desc="${APP_DESCS[$name]}"
        if [[ -n "$desc" ]]; then
            printf "%-35s  \033[2m%s\033[0m\n" "$name" "$desc"
        else
            printf "%s\n" "$name"
        fi
    done
}

# ── Launch selected app ───────────────────────────────────────────────────────

launch_app() {
    local name="$1"
    # Strip trailing description (everything after 2+ spaces)
    name=$(echo "$name" | sed 's/  \+.*//' | sed 's/[[:space:]]*$//')
    local cmd="${APP_CMDS[$name]}"

    [[ -z "$cmd" ]] && exit 1

    # Determine if it's a terminal app
    if grep -rl "^Name=$name$" "${APP_DIRS[@]}" 2>/dev/null | \
       xargs grep -l "^Terminal=true" 2>/dev/null | grep -q .; then
        # Try common terminals in order
        for term in foot alacritty kitty wezterm xterm; do
            if command -v "$term" &>/dev/null; then
                swaymsg "exec $term -e $cmd"
                exit 0
            fi
        done
    fi

    swaymsg "exec $cmd"
}

# ── Main ──────────────────────────────────────────────────────────────────────

parse_desktop_files

CHOICE=$(build_menu | fzf \
    --prompt="  Search Apps  " \
    --height=60% \
    --layout=reverse \
    --border=rounded \
    --border-label="  Applications " \
    --border-label-pos=3 \
    --color="bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8" \
    --color="fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc" \
    --color="marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8" \
    --color="border:#6c7086,label:#cba6f7" \
    --ansi \
    --no-scrollbar \
    --margin=1,2 \
    --pointer="▶" \
    --no-multi \
    --tiebreak=begin,index \
    --bind="ctrl-j:down,ctrl-k:up,tab:down,btab:up" \
    --preview='
        name=$(echo {} | sed "s/  \+.*//;s/[[:space:]]*$//")
        for dir in /usr/share/applications /usr/local/share/applications ~/.local/share/applications; do
            file=$(grep -rl "^Name=$name$" "$dir" 2>/dev/null | head -1)
            [[ -n "$file" ]] && break
        done
        if [[ -n "$file" ]]; then
            echo ""
            grep -E "^(Name|GenericName|Comment|Exec|Icon|Categories|Version)=" "$file" \
                | sed "s/^Name=/  Name:        /;
                       s/^GenericName=/  Type:        /;
                       s/^Comment=/  Description: /;
                       s/^Exec=/  Command:     /;
                       s/^Icon=/  Icon:        /;
                       s/^Categories=/  Categories:  /;
                       s/^Version=/  Version:     /" \
                | sed "s/ %[a-zA-Z]//g"
        fi
    ' \
    --preview-window="right:35%:wrap:border-left")

[[ -z "$CHOICE" ]] && exit 0

launch_app "$CHOICE"
