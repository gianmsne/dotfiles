# plugins/cpu.sh
#!/bin/bash

CPU_INFO="$(top -l 2 -n 0 | grep "CPU usage" | tail -1)"
USER=$(echo "$CPU_INFO" | awk '{print $3}' | tr -d '%')
SYS=$(echo "$CPU_INFO" | awk '{print $5}' | tr -d '%')
CPU=$(echo "$USER + $SYS" | bc)

sketchybar --set "$NAME" label="${CPU}%"
