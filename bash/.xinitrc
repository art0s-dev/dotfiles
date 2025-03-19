#austauschen gegen display variable also screen später???
xrandr --output Virtual-1 --mode 1920x1080

#der prozess wird immer iwie gekillt vorher
#so kann ich mir wenigstens _SICHER_ sein, dass er läuft
systemctl --user restart emacsd.service

#Dunst starten
dunst &


exec i3 
