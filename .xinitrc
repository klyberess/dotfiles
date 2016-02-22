## See https://wiki.archlinux.org/index.php/Xinitrc ##

## Draw previously set wallpaper as per https://wiki.archlinux.org/index.php/feh#As_a_desktop_wallpaper_manager ##
sh ~/.fehbg &

## Script sourcing ##
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

## Daemons ##
mpd
compton -b

## Programs & Scripts ##
ruby weather.rb &

## Default WM/DE ##
session=${1:-fvwm}

## Start WM/DE ##
case $session in
  fvwm  ) exec fvwm;;
  openbox ) exec openbox;;
  *) exec $1;;
esac
