#!/bin/bash


cd glusterfs
echo "Into glusterfs dir" 2>&1 >/var/log/UpdateGlusterAndInstall.log
git pull
echo "Git pull done" 2>&1 >/var/log/UpdateGlusterAndInstall.log
./autogen.sh 2>&1 >/var/log/UpdateGlusterAndInstall.log
CFLAGS="-g -O0 -Werror -Wall -Wno-error=cpp -Wno-error=maybe-uninitialized" ./configure --prefix=/usr --libdir=/usr/lib64 --localstatedir=/var --sysconfdir=/etc --enable-debug 2>&1 >/var/log/UpdateGlusterAndInstall.log
make install 2>&1 >/var/log/UpdateGlusterAndInstall.log

while true
do
        echo "Press [CTRL+C] to stop.."
        sleep 1
done
