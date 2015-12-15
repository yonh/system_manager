# Version 0.0.1
# build
# sudo docker build -t yonh/gogs .
# run
# sudo docker run -d \
#	-p 2222:2222 \ 
#	-p 3000:3000 \ 
#	-v $PWD/gogs:/opt/gogs \
#	--name gogs  yonh/gogs

# basic image
FROM ubuntu:14.04
MAINTAINER yonh "azssjli@163.com"
ENV REFERSHED_AT 2015-06-13

ADD sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git openssh-server && rm -rf /var/lib/apt/lists/*

add gogs /opt/gogs
#run adduser git

# modify default ssh port
run sed -i 's/Port 22/Port 2222/g' /etc/ssh/sshd_config 

#add sshd_config /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

add run.sh /run.sh
volume /home/git
#run chmod 777 /run.sh && userdel git && useradd git && chown git:git /opt/gogs -R && chown git:git /home/git -R
run chmod 777 /run.sh && useradd git  

EXPOSE 2222 3000

CMD ["/run.sh"]
