#!/bin/bash

/usr/sbin/sshd -D &
chown git:git /home/git -R
chown git:git /opt/gogs -R
su git -l -c "cd /opt/gogs; ./gogs web"

