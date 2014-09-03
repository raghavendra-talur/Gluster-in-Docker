# A fedora image which has all deps of gluster installed.
# Clones the git repo of gluster.
# Uses supervisord to run all services required for gluster.

FROM fedora:20
MAINTAINER Raghavendra Talur <raghavendratalur@gmail.com>

RUN yum -y install deltarpm
RUN yum -y install python-devel python-setuptools gcc yum-utils git           \
                   autoconf automake bison dos2unix flex glib2-devel          \
                   libaio-devel libattr-devel libibverbs-devel                \
                   librdmacm-devel libtool libxml2-devel make openssl-devel   \
                   pkgconfig python-devel python-eventlet python-netifaces    \
                   python-paste-deploy python-simplejson python-sphinx        \
                   python-webob pyxattr readline-devel rpm-build gdb dbench   \
                   net-tools systemtap-sdt-devel attr psmisc findutils which  \
                   xfsprogs yajl-devel lvm2-devel e2fsprogs mock nfs-utils    \
                   openssh-server supervisor openssl fuse-libs wget lvm2-devel\
                   fuse-devel cmockery2


RUN cd /root && \
    git clone git://review.gluster.org/glusterfs && \
    cd glusterfs  && \
    ./autogen.sh && \
    ./configure --enable-debug && \
    make ;


RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN echo 'root:password' | chpasswd
RUN ssh-keygen -A

ADD makefusedev.sh   /usr/sbin/makefusedev.sh
ADD supervisord.conf /etc/supervisord.conf


EXPOSE 22 111 245 443 24007 2049 8080 6010 6011 6012 38465 38466 38468 38469 49152 49153 49154 49156 49157 49158 49159 49160 49161 49162


CMD ["/usr/bin/supervisord"]
