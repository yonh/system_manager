#!/bin/bash
# 删除原项目的.svn文件
# 需要cd至被删除目录下执行

#直接删除
find $PWD|grep .svn\$|awk '{print "rm -rf "$1}|bash

# 使用git删除,原理同样
# find $PWD|grep .svn\$|awk '{print "git rm -rf "$1}|bash
