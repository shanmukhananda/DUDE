#!/bin/bash

if [ ! "${EUID}" = "0" ]
then
   echo "ERROR: ${0} must be run as root" 
   exit 1
fi

script_dir=$(realpath $(dirname $0))
${script_dir}/private/install-from-apt.sh

configure() {
    useradd -ms /bin/bash desktop
    sed -i '/TerminalServerUsers/d' /etc/xrdp/sesman.ini
    sed -i '/TerminalServerAdmins/d' /etc/xrdp/sesman.ini
    xrdp-keygen xrdp auto
    echo "desktop:desktop" | chpasswd
    touch /home/desktop/.xsession
    echo "mate-session" > /home/desktop/.xsession
}

configure
