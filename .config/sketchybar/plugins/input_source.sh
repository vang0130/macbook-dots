#!/bin/bash

# Extract the current KeyboardLayout ID
current_id=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -A 1 'InputSourceKind = "Keyboard Layout"' | grep -o '"KeyboardLayout ID" = [0-9]*' | awk -F'= ' '{print $2}')

# Debugging: Log the extracted ID
echo "Extracted ID: $current_id" >> /tmp/input_source_debug.log

# Map the ID to a label
case "$current_id" in
  15) LABEL="AU" ;;      # Australian
  12825) LABEL="CO" ;;   # Colemak
  *) LABEL="??" ;;       # Default fallback
esac

# Debugging: Log the chosen label
echo "Chosen label: $LABEL" >> /tmp/input_source_debug.log

# Update the SketchyBar item
sketchybar --set $NAME label="$LABEL"
