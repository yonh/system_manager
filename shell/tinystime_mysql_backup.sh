dir="/opt/scripts/tinystime/"
filename="${dir}db_tinystime.$(date "+%Y-%m-%d").sql"
lujia="${dir}db_lujia.$(date "+%Y-%m-%d").sql"

mysqldump --database db_tinystime -u u_tinystime -pkaki0108@@ > $filename
mysqldump --database db_lujia -u u_lujia -p@pwd2lujia@ > $lujia
# delete file
d=`date -d "-10 day" +%Y-%m-%d`
chmod o-r /opt/scripts/tinystime -R
lujia_file="${dir}db_lujia.${d}.sql"
tinystime_file="${dir}db_tinystime.${d}.sql"
rm -rf $tinystime_file
rm -rf $lujia_file

