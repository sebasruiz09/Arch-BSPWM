#!/bin/sh
# [autor] : sebastian Ruiz
# [github] : @sebasruiz09
if bluetoothctl show | grep -q "Powered: yes"; then
  if bluetoothctl info | grep -q 'Device'; then
    echo "%{F#5594C7} $(bluetoothctl info | awk '/Name/ {print $2" "$3}' | tr '[:lower:]' '[:upper:]')"
  else
    echo ""
  fi
else
  echo "%{F#66ffffff}"
fi
