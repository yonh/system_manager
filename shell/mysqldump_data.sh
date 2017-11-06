#!/bin/bash
# 自动备份数据库脚本
# 备份名为 数据库名.sql

# 备份目录
#backupdir="mysql_backups"
backupdir=`pwd`/sql
# 备份用户
user=""
# 用户密码
password=""
ip="127.0.0.1"
db_name=""
fullname=$backupdir/data.sql

# 导出表结构不导出数据
mysqldump --opt  --no-create-info -u$user -p'YOUR_PASSWORD' -h$ip --database $db_name --skip-lock-tables > $fullname
