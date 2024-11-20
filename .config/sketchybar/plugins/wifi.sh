# #!/usr/bin/env sh

# CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
# SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
# CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

# if [ "$SSID" = "" ]; then
#   sketchybar --set $NAME label="Disconnected" icon=睊
# else
#   sketchybar --set $NAME label="$SSID (${CURR_TX}Mbps)" icon=直
# fi

#!/bin/sh

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

if [[ $IP_ADDRESS != "" ]]; then
	COLOR=$COLOR_WHITE
	ICON=􀙇
	LABEL=$IP_ADDRESS
else
	COLOR=$COLOR_WHITE
	ICON=􀙈
	LABEL="Not Connected"
fi

sketchybar --set $NAME \
	icon=$ICON \
	label=$LABEL

