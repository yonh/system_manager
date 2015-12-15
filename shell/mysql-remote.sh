#!/bin/sh

HOSTNAME="127.0.0.1"
HOSTNAME="localhost"
USERNAME="root"
PASSWORD="kaki0108"

#一位参数是默认修改dev用户
if [ $# -eq 1 ]; then
    #判断参数1是否合法
    if [ $1 = 'y' ]; then
        up="update mysql.user set Host='%' where Host='localhost' and User='dev'"
    elif [ $1 = 'n' ]; then
        up="update mysql.user set Host='localhost' where Host='%' and User='dev'"
    elif [ $1 = 'na' ]; then
        up="update mysql.user set Host='localhost' where Host='%'"
    else
        echo "参数1应为y/n/na"
    fi

elif [ $# -eq 2 ]; then
    #判断参数1是否合法
    if [ $1 = 'y' ]; then
        up="update mysql.user set Host='%' where Host='localhost' and User='$2'"
    elif [ $1 = 'n' ]; then
        up="update mysql.user set Host='localhost' where Host='%' and User='$2'"
    elif [ $1 = 'na' ]; then
        up="update mysql.user set Host='localhost' where Host='%'"
    else
        echo "参数1应为y/n/na"
    fi
else
    echo "***** 打开Mysql用户的远程访问权限"
    echo "参数1 [y|n|na]  ( y打开 n关闭 na关闭所有远程访问 )   <必须>"
    echo "参数2 mysql用户, 默认为dev"

    exit
fi

#更新mysql授权
flush="flush privileges"

#execute sql
mysql -h${HOSTNAME}  -u${USERNAME} -p${PASSWORD} -e "${up}"
mysql -h${HOSTNAME}  -u${USERNAME} -p${PASSWORD} -e "${flush}"
