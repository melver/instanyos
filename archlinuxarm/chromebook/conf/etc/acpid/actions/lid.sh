#!/bin/bash

BRIGHTNESS_SAVE=/tmp/brightness-save
BRIGHTNESS_NOW=/sys/class/backlight/pwm-backlight.0/brightness

if [[ "$3" == "open" ]]; then
	[[ -r "$BRIGHTNESS_SAVE" ]] && echo "$(< "$BRIGHTNESS_SAVE")" > "$BRIGHTNESS_NOW"
	rm -f "$BRIGHTNESS_SAVE"
else
	echo "$(< "$BRIGHTNESS_NOW")" > "$BRIGHTNESS_SAVE"
	echo 0 > "$BRIGHTNESS_NOW"
fi

