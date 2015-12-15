#!/bin/bash

file="/svn/$1/hooks/post-commit"
source="svn_empty"
svndir="/svn/"
user="u_$1"
webdir="/var/www/$1"
log="/opt/scripts/svn.log"

#mysql
HOSTNAME="localhost"
USERNAME="root"
PASSWORD="kaki0108"

if [ ! $# -eq 2 ]; then
    echo "***** 创建svn库并创建mysql账户,数据库 (创建后的用户和数据库会加上前缀u_,db_)"
    echo "参数1 项目名称        <必须>"
    echo "参数2 mysql用户密码 <必须>"
    exit
fi
#判断/var/www下是否存在目录
if [ -d "$webdir" ]; then
    echo "$webdir目录早已存在$1"
    exit
fi
#判断/svn/下是否存在目录
if [ -d "/svn/$1" ]; then
    echo "/svn/$1目录早已存在"
    exit
fi

#判断mysql用户是否被创建了
c=`mysql -h${HOSTNAME}  -u${USERNAME} -p${PASSWORD} -e "select count(*) from mysql.user where user='$user'" | tail -n +2`
echo "user:$c"

if [ $c -gt 0 ]; then
    echo '用户$user已经存在'
    exit
fi

echo "" >> $log
time=$(date +%Y-%m-%d\ %H:%M:%S)
echo $time >> $log
cp -r $svndir$source $svndir$1
echo "创建svn项目$svndir$1,目录位置:$svndir$1"
echo "创建svn项目$svndir$1,目录位置:$svndir$1" >> $log

echo "#!/bin/sh" > $file
echo "REPOS=\"\$1\"" >> $file
echo "REV=\"\$2\"" >> $file
echo "svn update /var/www/$1/ --username accessor --password Namm4508@">>$file
echo "echo \`whoami\`,\$REPOS,\$REV >> /svn/$1/commit.log" >>$file
echo "chown -R www-data:www-data /var/www/$1">>$file

mkdir $webdir

svn co file:///svn/$1 $webdir
echo "创建目录$webdir"
echo "创建目录$webdir" >> $log

#chmod 744 $file
# call script : create user and db
/opt/scripts/mysql_create.sh $user $2 db_$1 $log