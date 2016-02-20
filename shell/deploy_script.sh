#/bin/bash

project="project"
dep_dir="/var/www/${project}"
cd /git/down/shiniu/
#git checkout master && git pull
git checkout develop && git pull

cp -rf /git/down/${project} /var/www
chown -R www-data:www-data ${dep_dir}
rm -rf ${dep_dir}/.git
rm -f ${dep_dir}/.gitignore
rm -f ${dep_dir}/README.md
rm -f ${dep_dir}/*.sql
rm -f ${dep_dir}/Data/*.sql


cd ${dep_dir}
find -type d -exec chmod 740 {} \;
echo "部署完成"
#chmod -R 640 /var/www/${project}
#chmod -R 740 /var/www/${project}/Runtime
#chmod 740 ${dep_dir}/*
