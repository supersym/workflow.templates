#!/usr/bin/env bash
#
# Starting an X session is typically done in one of two ways:#{{{
# (1) the session is started via a display manager (user logs in at GUI screen);
# (2) the user starts X manually (startx) after logging in to a text console.

# X runs with root privileges in either case, it needs raw access to hardware devices.

# http://www.tldp.org/HOWTO/XWindow-User-HOWTO/runningx.html
#

# Environment local scope variables #
#
# File name/references which are being repeatively used
# in this configuration file.
errorlog="${HOME}/.xerrors"
gnupglog="${HOME}/.gnupg/gpg-agent.info"
oldconfig="${HOME}/.Xdefaults"
usermodmap="${HOME}/.Xmodmap"
userresources="${HOME}/.Xresources"
sysmodmap="/etc/X11/xinit/.Xmodmap"
sysresources="/etc/X11/xinit/.Xresources"

# }}}

# External dependencies and included code libraries # {{{ 
# Pull in any system-wide application specific configurations
# as found usually per convention inside /etc/*.d folders
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Imports and includes, dependencies or just template files:
# merge the system-wide user resources and keymaps all neatly.
[[ -r "${sysresources}" ]]  && xrdb -merge "${sysresources}"
[[ -r "${sysmodmap}" ]]     && xmodmap "${sysmodmap}"
[[ -r "${userresources}" ]] && xrdb -merge "${userresources}"
[[ -r "${usermodmap}" ]]    && xmodmap "${usermodmap}"
[[ -f "${oldconfig}" ]]     && xrdb -merge "${oldconfig}"



##
# COMPOSITING WINDOW MANAGER
##


compton -cC -i 0.6 -e 0.6 -f &

if [ pgrep -u "${USER}" gpg-agent ]; then
    eval $(cat ${gnupglog})
    eval $(cut -d= -f1 ${gnupglog} | xargs echo export)
else
    #eval $(gpg-agent --enable-ssh-support --daemon)
    eval  $(gpg-agent --daemon)
fi

## Start the SSH-Agent to replace broken GnuPG agent ???
if [ pgrep -u "${USER}" ssh-agent ]; then
    eval $(cat ${HOME}/.keychain/${HOSTNAME}-sh)
else
    eval $(ssh-agent --exit-with-session)
  (sleep 15 && keychain -q --timeout 480 --agents ssh fosfor ghsusy)&
fi


# Start x window

# Make sure this is before the 'exec' command or it won't be executed.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile




#
# Notice the Window Managers are not "backgrounded" with "&" here. This is
# important! Something has to run in the foreground, or X will exit.
#
#  Window manager selection
#
case "$WM" in
  failsafe|twm)
    exec twm
    ;;
  fvwm)
    exec fvwm2
    ;;
  fluxbox)
    exec fluxbox
    ;;
  awesome)
    exec awesome >> ~/.wm-errors 2>&1
    ;;
  icewm)
    exec icewm
    ;;
  *)
    exec awesome
    ;;
esac

