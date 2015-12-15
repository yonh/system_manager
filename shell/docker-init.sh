#!/bin/bash
#sudo brctl addbr lxcbr0
#sudo ip addr add 192.168.5.1/24 dev bridge0
#sudo ip link set dev bridge0 up
#echo 'DOCKER_OPTS="-b=bridge0"' >> /etc/default/docker
sudo service docker start
