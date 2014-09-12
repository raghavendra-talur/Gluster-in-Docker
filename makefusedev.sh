#!/bin/bash
mknod /dev/fuse c 10 229

mknod /dev/loop3 -m0660 b 7 3
mknod /dev/loop4 -m0660 b 7 4
mknod /dev/loop5 -m0660 b 7 5
mknod /dev/loop6 -m0660 b 7 6
mknod /dev/loop7 -m0660 b 7 7
mknod /dev/loop8 -m0660 b 7 8
mknod /dev/loop9 -m0660 b 7 9
mknod /dev/loop10 -m0660 b 7 10
mknod /dev/loop11 -m0660 b 7 11
mknod /dev/loop12 -m0660 b 7 12
mknod /dev/loop13 -m0660 b 7 13

sed -i 's/udev_sync\s*=\s*1/udev_sync = 0/' /etc/lvm/lvm.conf
sed -i 's/udev_rules\s*=\s*1/udev_rules = 0/' /etc/lvm/lvm.conf
sed -i 's/use_lvmetad\s*=\s*1/use_lvmetad = 0/' /etc/lvm/lvm.conf

while true
do
        echo "Press [CTRL+C] to stop.."
        sleep 1
done
