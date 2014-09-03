Gluster-in-Docker
=================

A Dockerfile and its related files for building a container which can run gluster and gluster test environment.


git clone the repo.
Install docker.
docker build using the Dockerfile in the repo.
Start the docker container: docker run -d --privileged=true imageName
Use docker inspect to get ip of the container.
ssh into root@IP with password "password".
cd into glusterfs
make install.
./run-tests.sh



Note:

1. you may have some problems with lvm related commands in container if appropriate kernel modules are not loaded in the host machine.
I faced issue with dm_snapshot on ubuntu host.

2. 
