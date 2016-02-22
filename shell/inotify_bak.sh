#!/bin/bash
src=/www
dist=/www/
toip=11.11.11.11
inotifywait -mrq --timefmt '%d/%m/%y %H:%M' --format '%T %w%f%e' -e close_write,delete,create,attrib $src |  while read file
do
	rsync -raz --delete  --exclude-from ignore_file  $src root@$toip:$dist
done
