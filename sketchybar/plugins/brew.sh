#!/bin/bash

BREW="/opt/homebrew/bin/brew"

COUNT=$($BREW outdated | wc -l | tr -d ' ')

GREEN=0xff72c369
RED=0xffeb6572

if [ "$COUNT" -eq 0 ]; then
  sketchybar --set brew icon.color=$GREEN label.color=$GREEN label="Updated"
else
  sketchybar --set brew icon.color=$RED label.color=$RED label="$COUNT outdated"
fi