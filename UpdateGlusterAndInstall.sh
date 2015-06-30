#!/bin/bash


cd glusterfs
git pull
./autogen.sh
CFLAGS="-g -O0 -Werror -Wall -Wno-error=cpp -Wno-error=maybe-uninitialized" ./configure --prefix=/usr --libdir=/usr/lib64 --localstatedir=/var --sysconfdir=/etc --enable-debug
make install

while true
do
        echo "Press [CTRL+C] to stop.."
        sleep 1
done
