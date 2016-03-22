#!/bin/bash
# 自动备份数据库脚本
# 备份名为 数据库名.sql

# 备份目录
backupdir="/home/tiny/dump/3"
# 备份用户
user="root"
# 用户密码
password="root"

# 自动创建备份文件夹
if [ ! -d $backupdir ]; then
    mkdir -p $backupdir
fi


# 获取需要备份的数据库表名
# 过滤掉performance_schema information_schema mysql3个表
# 行号>1是因为第一行是Database
dbnames=`mysql -u$user -p$password -e "show databases"|awk 'NR>1 && $0!="mysql" && $0!="performance_schema" && $0!="information_schema"'`

for dbname in $dbnames; do
    if [ ! "$dbname" = "performance_schema" ] &&
        [ ! "$dbname" = "information_schema" ] &&
        [ ! "$dbname" = "mysql" ]; then
        `mysqldump -uroot -proot --database $dbname > $backupdir/$dbname.sql` > /dev/null
    fi
done