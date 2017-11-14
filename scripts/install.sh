#!/bin/bash

if [ ! "${EUID}" = "0" ]
then
   echo "ERROR: ${0} must be run as root" 
   exit 1
fi

script_dir=$(realpath $(dirname $0))
${script_dir}/private/install-from-apt.sh

configure() {
    sed -i '/TerminalServerUsers/d' /etc/xrdp/sesman.ini
    sed -i '/TerminalServerAdmins/d' /etc/xrdp/sesman.ini
    xrdp-keygen xrdp auto
    echo "root:root" | chpasswd
    mkdir -p /home/root
    touch /home/root/.xsession
    echo "mate-session" > /home/root/.xsession
}

configure
