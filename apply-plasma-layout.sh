#!/bin/bash
# Clears KDE Plasma panel config, applies layout, patches screen assignments,
# then restarts plasmashell so panels appear on the correct monitors.

CONFIG="$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"
SCRIPT="$HOME/thebetar/plasma-script.js"

wait_for_plasmashell() {
    local attempts=0
    while ! qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "" &>/dev/null; do
        sleep 1
        attempts=$((attempts + 1))
        if [ $attempts -ge 60 ]; then
            echo "Timeout waiting for plasmashell" >&2
            return 1
        fi
    done
    sleep 2
}

# 1. Delete the config file to start clean
rm -f "$CONFIG"
rm -f "${CONFIG}.lock"

# 2. Restart plasmashell with a clean slate
kquitapp5 plasmashell 2>/dev/null
sleep 2
kstart5 plasmashell 2>/dev/null &
disown

# 3. Wait for plasmashell to be ready
wait_for_plasmashell || exit 1

# 4. Apply the layout script and capture panel-to-screen mappings
OUTPUT=$(qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "$(cat "$SCRIPT")" 2>&1)
echo "$OUTPUT"

# 5. Patch lastScreen in the config file for each panel containment
#    The JS script outputs lines like: PANEL_SCREEN:<containment_id>:<screen>
echo "$OUTPUT" | grep '^PANEL_SCREEN:' | while IFS=: read -r _ panel_id screen_id; do
    echo "Patching Containment $panel_id -> lastScreen=$screen_id"
    # Find the [Containments][ID] section and replace lastScreen
    sed -i "/^\[Containments\]\[$panel_id\]$/,/^\[/ s/^lastScreen=.*/lastScreen=$screen_id/" "$CONFIG"
done

# 6. Restart plasmashell so it reads the patched screen assignments
sleep 1
kquitapp5 plasmashell 2>/dev/null
sleep 2
kstart5 plasmashell 2>/dev/null &
disown

echo "Layout applied. Plasmashell restarting."
