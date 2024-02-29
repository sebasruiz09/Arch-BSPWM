#!/bin/bash

killall conky
sleep 2s

conky -c $HOME/.config/conky/Alfirk/Alfirk.conf &> /dev/null &
conky -c $HOME/.config/conky/Alfirk/Alfirk3.conf &> /dev/null &
conky -c /home/sebas/.config/conky/conky-spotify/conky-spotify-medium &> /dev/null &

exit
