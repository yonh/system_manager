# backup git rep
cp -rf /git/gogs/git /backup/git/$(date "+%Y-%m-%d")
d=`date -d "-10 day" +%Y-%m-%d`
rm -rf /backup/git/${d}
