#!/bin/bash

# 导出docker镜像
mkdir -p /tmp/docker

docker images|awk '{print "docker save "$1":"$2" > /tmp/docker/"$1":"$2".tar"}'|grep -v "<none>" |grep -v "REPOSITORY:TAG" | xargs -i -t bash -c "{}"



