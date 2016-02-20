#!/bin/bash
date=`date  +%Y-%m-%d-%H-%M`
if curl ?head  http://xxx.com?s=haha | grep "200" >/dev/null 2>&1 ; then
	echo lighttpd is ok $date >>/var/log/check_lighttpd.log
else
	echo lighttpd is error $date >>/var/log/check_lighttpd.log
	#/etc/init.d/lighttpd restart
fi
