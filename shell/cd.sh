#/bin/sh
# open a file or directory
$1 >& /dev/null
dir="/var/www/$1"
if [ -d $dir ]; then
	cd $dir
fi
