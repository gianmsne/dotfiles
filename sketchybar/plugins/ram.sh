# plugins/ram.sh
#!/bin/bash

FREE_PCT=$(memory_pressure | grep "System-wide memory free percentage" | awk '{print $5}' | tr -d '%')
USED_PCT=$((100 - FREE_PCT))

sketchybar --set "$NAME" label="${USED_PCT}%"
