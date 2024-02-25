#!/bin/bash

theme=$1
weather_code=$2
cp -r ~/.config/conky/Betelgeuse/icons/${theme}/${weather_code}.png ~/.config/conky/Betelgeuse/.cache/weather.png

exit
