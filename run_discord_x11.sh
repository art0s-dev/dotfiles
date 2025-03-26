flatpak run --nosocket=fallback-x11 --nosocket=wayland --socket=x11 --unset-env=WAYLAND_DISPLAY --env=GDK_BACKEND=x11 --env=XDG_SESSION_TYPE=x11 com.discordapp.Discord
