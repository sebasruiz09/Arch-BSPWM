#!/bin/sh

time=$(date +%H:%M | cut -d ':' -f 1)

if [ $time -gt 12 ] && [ $time -lt 18 ]; then
  feh --bg-fill ~/Wallpaper/sunset_forest.jpg;
fi

if [ $time -gt 18 ] && [ $time -lt 24 ]; then
  feh --bg-fill ~/Wallpaper/night_forest.jpg;
fi

if [ $time -gt 00 ] && [ $time -lt 12 ]; then
  feh --bg-fill ~/Wallpaper/sunrise_forest.jpg;
fi

