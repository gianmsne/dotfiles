#!/bin/bash

COUNT=$(brew outdated | wc -l | tr -d ' ')

GREEN=0xff72c369
RED=0xffeb6572

if [ "$COUNT" -eq 0 ]; then
  sketchybar --set brew icon.color=$GREEN label.color=$GREEN label="Up to date"
else
  sketchybar --set brew icon.color=$RED label.color=$RED label="$COUNT outdated"
fi