xmodmap ~/.config/X/.xmodmap &
xbindkeys &
sh ~/.config/X/xcape.sh & 
feh --bg-fill ~/.config/wallpapers/firewatch-galaxy.jpg &
xrandr --output DP-5 --rotate left --left-of HDMI-0 &
slstatus &
emacs --daemon &
dunst &
sh ~/.config/dunst/reload_dunst.sh &
exec dwm

# Uncomment for EXWM

#xhost +SI:localuser:$USER
#export _JAVA_AWT_WM_NONREPARENTING=1
#xsetroot -cursor_name left_ptr
#xset r rate 200 60
#exec emacs
