if ps aux | grep '[p]icom'
then
  killall picom
else
  killall picom ; picom -i 0 &
fi
