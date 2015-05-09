# A fedora image which has all deps of gluster installed.
# Clones the git repo of gluster.
# Uses supervisord to run all services required for gluster.

FROM fedora:21
MAINTAINER Raghavendra Talur <raghavendratalur@gmail.com>

RUN yum -y install deltarpm

RUN yum -y install attr
RUN yum -y install autoconf
RUN yum -y install automake
RUN yum -y install bison
RUN yum -y install cmockery2
RUN yum -y install cmockery2-devel
RUN yum -y install dbench
RUN yum -y install dos2unix
RUN yum -y install e2fsprogs
RUN yum -y install findutils
RUN yum -y install flex
RUN yum -y install fuse-devel
RUN yum -y install fuse-libs
RUN yum -y install gcc
RUN yum -y install gdb
RUN yum -y install git
RUN yum -y install glib2-devel
RUN yum -y install libacl-devel
RUN yum -y install libaio-devel
RUN yum -y install libattr-devel
RUN yum -y install libibverbs-devel
RUN yum -y install librdmacm-devel
RUN yum -y install libtool
RUN yum -y install libxml2-devel
RUN yum -y install lvm2-devel
RUN yum -y install lvm2-devel
RUN yum -y install make
RUN yum -y install mock
RUN yum -y install net-tools
RUN yum -y install nfs-utils
RUN yum -y install openssh-server
RUN yum -y install openssl
RUN yum -y install openssl-devel
RUN yum -y install pkgconfig
RUN yum -y install psmisc
RUN yum -y install python-devel
RUN yum -y install python-devel
RUN yum -y install python-eventlet
RUN yum -y install python-netifaces
RUN yum -y install python-paste-deploy
RUN yum -y install python-setuptools
RUN yum -y install python-simplejson
RUN yum -y install python-sphinx
RUN yum -y install python-webob
RUN yum -y install pyxattr
RUN yum -y install readline-devel
RUN yum -y install rpm-build
RUN yum -y install strace
RUN yum -y install supervisor
RUN yum -y install systemtap-sdt-devel
RUN yum -y install sqlite-devel
RUN yum -y install vim
RUN yum -y install wget
RUN yum -y install which
RUN yum -y install xfsprogs
RUN yum -y install yajl-devel
RUN yum -y install yum-utils
RUN yum -y install userspace-rcu-devel

RUN cd /root && \
    git clone git://review.gluster.org/glusterfs && \
    cd glusterfs  && \
    ./autogen.sh && \
    ./configure --enable-debug && \
    make install;


RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN echo 'root:password' | chpasswd
RUN ssh-keygen -A

ADD makefusedev.sh   /usr/sbin/makefusedev.sh
ADD supervisord.conf /etc/supervisord.conf


EXPOSE 22 111 245 443 24007 2049 8080 6010 6011 6012 38465 38466 38468 38469 49152 49153 49154 49156 49157 49158 49159 49160 49161 49162


CMD ["/usr/bin/supervisord"]
