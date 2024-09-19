#!/usr/bin/env bash

flag_file="/tmp/notify_battery_low_flag"
battery_low=20

battery_capacity_file="/sys/class/power_supply/BAT0/capacity"
battery_level=$(cat $battery_capacity_file)

if [ $battery_level -lt $battery_low ]; then
  if [ ! -f $flag_file ]; then
    touch $flag_file
    notify-send -u critical "battery low" "capacity at ${battery_level}%"
  fi
else
  if [ -f $flag_file ]; then
    rm $flag_file
  fi
fi
