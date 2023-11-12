if xrandr -q | grep 'HDMI-1-1 connected'; then
  echo "HDMI-1-1"
else
  echo "eDP"
