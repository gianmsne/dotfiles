#!/bin/bash

# Fetch condition + temp for Melbourne, AU, separated by a pipe
RESPONSE=$(curl -s --max-time 5 "https://wttr.in/Melbourne?format=%C|%t")
CONDITION=$(echo "$RESPONSE" | cut -d'|' -f1 | tr '[:upper:]' '[:lower:]')
TEMP=$(echo "$RESPONSE" | cut -d'|' -f2)

if [ -z "$RESPONSE" ]; then
  sketchybar --set weather icon="" label="N/A"
  exit 0
fi

case "$CONDITION" in
  *thunder*)                 ICON="" ;;
  *snow*|*sleet*|*ice*)      ICON="" ;; 
  *rain*|*drizzle*|*shower*) ICON="" ;; 
  *fog*|*mist*|*haze*)       ICON="" ;; 
  *overcast*)                ICON="" ;; 
  *cloud*|*partly*)          ICON="" ;; 
  *clear*|*sunny*)           ICON="" ;; 
  *)                         ICON="" ;;
esac

sketchybar --set weather icon="$ICON" label="$TEMP"