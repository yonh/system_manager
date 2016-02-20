db=db
dir="/opt/scripts/db/"
filename="${dir}db_$db.$(date "+%Y-%m-%d").sql"

mysqldump --database db -u root -proot > $filename
# delete file
d=`date -d "-10 day" +%Y-%m-%d`
chmod o-r /opt/scripts/db -R
db_file="${dir}db_$db.${d}.sql"
rm -rf $db_file

