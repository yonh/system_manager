#!/bin/bash

# 程序拉取svn最新代码
# 并生成报表到指定目录
# 统计php,html,js,css文件
# 忽略framework,vendor,图片文件


rep_name="repname" # 库目录名称
dir="/path/to/your/dir" # 基础地址
tmp_name="origin_tmp" # 临时目录
outputdir="/path/to/output" # 输出报表目录
statsvn="/opt/statsvn.jar" # statsvn.jar地址
rep_dir="$dir/$tmp_name"
svnlog="svn.log"
log="$rep_dir/$svnlog"

cd $dir/$rep_name
svn update
cd ..
cp -rf $rep_name $tmp_name
cd $tmp_name
svn log -v --xml > $svnlog

cd ..
#argv_include="-include '*.php:**/*.html:**/*.js:**/*.css'"
argv_include=""
argv_exclude="-exclude framework/*:vendor/*:**/*.png:**/*.jpg"

echo "start..."

#java -jar /opt/statsvn.jar ./svn.log ./rep_name -charset utf-8 -disable-twitter-button -title title -include **/*.php -exclude **/framework/*.* -output-dir /path/to/output
java -jar $statsvn $log $rep_dir -output-dir $outputdir \
-charset utf-8 \
$argv_include \
$argv_exclude \

echo "done..."
rm -rf $tmp_nam
