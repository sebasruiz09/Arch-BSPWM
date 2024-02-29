#!/bin/bash

id_current=$(cat ~/.config/conky/conky-spotify/current/current.txt)
id_new=`~/.config/conky/conky-spotify/scripts/id.sh`
cover=
imgurl=
dbus=`busctl --user list | grep "spotify"`

if [ "$dbus" == "" ]; then
       `cp ~/.config/conky/conky-spotify/empty.jpg ~/.config/conky/conky-spotify/current/current.jpg`
	echo "" > ~/.config/conky/conky-spotify/current/current.txt
else
	if [ "$id_new" != "$id_current" ]; then

		echo $id_new > ~/.config/conky/conky-spotify/current/current.txt
		imgname=`cat ~/.config/conky/conky-spotify/current/current.txt | cut -d '/' -f5`

		cover=`ls ~/.config/conky/conky-spotify/covers | grep "$id_new"`

		if grep -q "${imgname}" <<< "$cover"
		then
			`cp ~/.config/conky/conky-spotify/covers/$imgname.jpg ~/.config/conky/conky-spotify/current/current.jpg`
		else
			imgurl=`~/.config/conky/conky-spotify/scripts/imgurl.sh`
			`wget -q -O ~/.config/conky/conky-spotify/covers/$imgname.jpg $imgurl &> /dev/null`
			`touch ~/.config/conky/conky-spotify/covers/$imgname.jpg`
			`cp ~/.config/conky/conky-spotify/covers/$imgname.jpg ~/.config/conky/conky-spotify/current/current.jpg`
			# clean up covers folder, keeping only the latest X amount, in below example it is 10
			rm -f `ls -t ~/.config/conky/conky-spotify/covers/* | awk 'NR>10'`
			rm -f wget-log #wget-logs are accumulated otherwise
		fi
	fi
fi
