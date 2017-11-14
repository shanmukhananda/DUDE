#/bin/bash

useradd -ms /bin/bash desktop
echo 'pgrep -U $(id -u) lxsession | grep -v ^$_LXSESSION_PID | xargs --no-run-if-empty kill' > /bin/lxcleanup.sh
chmod +x /bin/lxcleanup.sh
echo '@lxcleanup.sh' >> /etc/xdg/lxsession/LXDE/autostart
echo "desktop:desktop" | chpasswd
