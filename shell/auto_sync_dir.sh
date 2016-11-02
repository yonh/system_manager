#!/bin/bash

# 先不考虑远程同步
# 先不考虑目录是否存在问题
# 先不考虑目录

# example:
# 同步~/abc/ -> ~/abcd/
# bash auto_sync_dir.sh ~/abc/ ~/abcd/


if [ ! $# -eq 2 ]; then
	echo "参数不合法,参数1源目录 参数2,目标目录"
	exit 0
fi

src="$1"
dest="$2"

echo "src: $src, dest: $dest"

install_inotify() {
	apt-get install -y inotify-tools
}

folder_exits() {
	if [ ! -d "$1" ]; then
		echo "目录$1不存在"
		exit 0
	fi
}


folder_exits $src
folder_exits $dest

if [ ! -f "/usr/bin/inotifywait" ] ; then
	install_inotify
fi

inotifywait -mrq --timefmt '%d/%m/%y %H:%M' --format '%T %w%f%e' -e close_write,delete,create,attrib $src |  while read file
do
	rsync -raz --delete $src $dest
done




