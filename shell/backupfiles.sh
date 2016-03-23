#!/bin/bash

# 需要备份的目录
dir="/opt/mysql/back"
# 文件列表
files=`ls $dir`
# 备份到哪个目录
history_dir="/opt/mysql/history"
# 当前日期
date=$(date "+%Y-%m-%d")
time=$(date "+%H:%M:%S")
# 最多保存备份天数
keep_day=30
# 应该删除的目录日期
del_date=`date -d "-$keep_day day" +%Y-%m-%d`

echo "=============$date $time============="

# 同步服务器文件
rsync -avz --delete root@db_redis:/opt/mysql/back/* /opt/mysql/back


mkdir -p $history_dir/$date # 创建今天备份目录
rm -rf $history_dir/$del_date # 按文件夹名称删除备份
#find $history_dir -mtime 81 -exec rm -rf {} \; # 按时间删除

for file in $files; do
    tar -C $dir -czf $history_dir/$date/$file.tar.gz $file
done

#shutdown -h now

