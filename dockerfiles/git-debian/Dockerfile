# Version 0.0.1
# build
# sudo docker build -t yonh/git-server:debian .

# run
# docker run -i -t -d -p 10022:22 -v /git/shiniu:/home/git/web/ -v /git/shiniu.git:/home/git/app.git --name git-server-shiniu yonh/git-server:latest
# docker run -d -p 10022:22 --name git \
#   -v /git/authorized_keys:/home/git/.ssh/authorized_keys
#   -v /git/shiniu.git:/home/git/app.git
#   yonh/git-server


#Run : run -p 1234:1234 –name git_server git:v1
#Create project : cd /home/git && mkdir projet.git && cd projet.git && git –bare init
#Clone : git clone ssh://git@yourserver:1234/home/git/yourproject.git

# basic image
FROM debian:wheezy
MAINTAINER yonh "azssjli@163.com"
ENV REFERSHED_AT 2015-02-28

#replace default sources.list
ADD sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git openssh-server && rm -rf /var/lib/apt/lists/*

# git user
RUN adduser git
# disable git login to shell
RUN chsh -s /usr/bin/git-shell git
WORKDIR /home/git/
RUN mkdir .ssh
RUN mkdir -p /git/dev_deploy/
#ADD authorized_keys /home/git/.ssh/authorized_keys
# RUN git init --bare app.git
run mkdir app.git
RUN chown -R git:git /home/git/

RUN mkdir /var/run/sshd

#RUN /usr/sbin/sshd -D &
# RUN /etc/init.d/ssh start
# ENTRYPOINT ["/usr/sbin/sshd", "-D"]

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
