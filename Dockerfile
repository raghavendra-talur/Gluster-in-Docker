# A fedora image which has all deps of gluster installed.
# Clones the git repo of gluster.
# Uses supervisord to run all services required for gluster.

FROM fedora:22
MAINTAINER Raghavendra Talur <raghavendratalur@gmail.com>

RUN dnf -y install deltarpm

RUN dnf -y install attr
RUN dnf -y install autoconf
RUN dnf -y install automake
RUN dnf -y install bison
RUN dnf -y install cmockery2
RUN dnf -y install cmockery2-devel
RUN dnf -y install dbench
RUN dnf -y install dos2unix
RUN dnf -y install e2fsprogs
RUN dnf -y install findutils
RUN dnf -y install flex
RUN dnf -y install fuse-devel
RUN dnf -y install fuse-libs
RUN dnf -y install gcc
RUN dnf -y install gdb
RUN dnf -y install git
RUN dnf -y install glib2-devel
RUN dnf -y install hostname
RUN dnf -y install libacl-devel
RUN dnf -y install libaio-devel
RUN dnf -y install libattr-devel
RUN dnf -y install libibverbs-devel
RUN dnf -y install librdmacm-devel
RUN dnf -y install libtool
RUN dnf -y install libxml2-devel
RUN dnf -y install lvm2-devel
RUN dnf -y install lvm2-devel
RUN dnf -y install make
RUN dnf -y install mock
RUN dnf -y install net-tools
RUN dnf -y install nfs-utils
RUN dnf -y install openssh-server
RUN dnf -y install openssl
RUN dnf -y install openssl-devel
RUN dnf -y install pkgconfig
RUN dnf -y install psmisc
RUN dnf -y install python-devel
RUN dnf -y install python-devel
RUN dnf -y install python-eventlet
RUN dnf -y install python-netifaces
RUN dnf -y install python-paste-deploy
RUN dnf -y install python-setuptools
RUN dnf -y install python-simplejson
RUN dnf -y install python-sphinx
RUN dnf -y install python-webob
RUN dnf -y install pyxattr
RUN dnf -y install readline-devel
RUN dnf -y install rpm-build
RUN dnf -y install strace
RUN dnf -y install supervisor
RUN dnf -y install systemtap-sdt-devel
RUN dnf -y install sqlite-devel
RUN dnf -y install vim
RUN dnf -y install wget
RUN dnf -y install which
RUN dnf -y install xfsprogs
RUN dnf -y install yajl-devel
RUN dnf -y install dnf-utils
RUN dnf -y install userspace-rcu-devel

RUN cd /root && git clone git://review.gluster.org/glusterfs

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN echo 'root:password' | chpasswd
RUN ssh-keygen -A

ADD makefusedev.sh   /usr/sbin/makefusedev.sh
ADD supervisord.conf /etc/supervisord.conf


EXPOSE 22 111 245 443 24007 2049 8080 6010 6011 6012 38465 38466 38468 38469 49152 49153 49154 49156 49157 49158 49159 49160 49161 49162


CMD ["/usr/bin/supervisord"]
