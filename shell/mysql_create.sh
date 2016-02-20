#!/bin/sh
HOSTNAME="localhost"
#数据库信息
PORT="3306"
USERNAME="root"
PASSWORD="root"
u="$1"
db="$3"
pwd="$2"
log="$4"

if [ $# -gt 2 ]; then
    up="insert into mysql.user(Host,User,Password) values('localhost','$u',password('$pwd'));"
    flush="flush privileges;"
    createdb="create database $db;"
    grant="grant all privileges on $db.* to $u@localhost;"

    #execute sql
    mysql -h${HOSTNAME}  -u${USERNAME} -p${PASSWORD} -e "${up}"
    mysql -h${HOSTNAME}  -u${USERNAME} -p${PASSWORD} -e "${flush}"
    echo "创建Mysql用户: $u 密码:$pwd"
    if [ $# -eq 4 ]; then
        echo "创建Mysql用户: $u 密码:$pwd" >> $log
    fi
    mysql -h${HOSTNAME}  -u${USERNAME} -p${PASSWORD} -e "${createdb}"
    echo "创建Mysql数据库: $db"
    if [ $# -eq 4 ]; then
    echo "创建Mysql数据库: $db" >> $log
    fi
    mysql -h${HOSTNAME}  -u${USERNAME} -p${PASSWORD} -e "${grant}"
else
    echo "***** 创建Mysql数据库, mysql账户"
    echo "参数1 Mysql新用户名    <必须>"
    echo "参数2 mysql新用户密码  <必须>"
    echo "参数3 mysql数据库      <必须>"
fi
