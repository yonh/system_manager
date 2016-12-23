#!/bin/bash

user=`date +%s | sha256sum | base64 | head -c 12 ; echo`
pw=`date +%s | sha256sum | base64 | head -c 16 ; echo`

useradd $user
echo -e "$pw\n$pw\n" | passwd $user
echo "$user : $pw"

