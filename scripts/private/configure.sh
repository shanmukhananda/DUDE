#/bin/bash

echo 'pgrep -U $(id -u) lxsession | grep -v ^$_LXSESSION_PID | xargs --no-run-if-empty kill' > /bin/lxcleanup.sh
chmod +x /bin/lxcleanup.sh
echo '@lxcleanup.sh' >> /etc/xdg/lxsession/LXDE/autostart
echo "root:root" | chpasswd
xrdp-keygen xrdp auto
