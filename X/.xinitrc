xmodmap ~/.config/X/.xmodmap &
xbindkeys &
sh ~/.config/X/xcape.sh &
xrandr --output DP-5 --rotate left --left-of HDMI-0 &
feh --bg-fill ~/.config/wallpapers/firewatch-galaxy.jpg &
emacs --daemon &
dunst &
sh ~/.config/dunst/reload_dunst.sh &
python ~/.config/xkeymode.py &
exec dwm
