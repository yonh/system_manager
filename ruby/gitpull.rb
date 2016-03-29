#!/usr/bin/ruby
## 从arr数组获取库地址,以及存储目录名称,存储到/opt/gitpull目录
## 可放于crontab让其每隔某个时段自动拷贝库文件

# 程序根目录
dir = File.dirname(__FILE__) + "/"

# 需要下载的库配置文件,格式[name, git地址],配置多行
# example
# name, 	https://github.com/yonh/system_manager.git
source = dir + "git.list" 


if !File.directory?(dir) then
	system("mkdir #{dir}");
end

f = File.open(File.dirname(__FILE__)+"/"+source,'r')

function .each_line do |l|
	arr = l.split(',')
	d = dir + "/" + arr[0]
	name = arr[0]
	git = arr[1]

	if !File.directory?(d) then
		system("git clone #{git} #{d}");
	else
		system("cd #{d};git pull");
	end
end


