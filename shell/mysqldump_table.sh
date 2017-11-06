#!/bin/bash

# 备份目录
backupdir=`pwd`/sql
# 备份用户
user=""
# 用户密码
password=""
ip="127.0.0.1"
db_name=""


mkdir -p $backupdir

# 导出表结构不导出数据
mysqldump --opt  --no-data -u$user -p'YOUR_PASSWORD' -h$ip --database agent --skip-lock-tables > $backupdir/table.sql
