#!/usr/bin/ruby
## 从arr数组获取库地址,以及存储目录名称,存储到/opt/gitpull目录
## 可放于crontab让其每隔某个时段自动拷贝库文件

dir="/opt/gitpull"

arr = [
	["conf","https://github.com/yonh/conf"],
	["conf2","https://github.com/yonh/conf"]
]

if !File.directory?(dir) then
	system("mkdir #{dir}");
end

arr.each do |a|
	d = dir + "/" + a[0]
	name = a[0]
	git = a[1]
	if !File.directory?(d) then
		system("git clone #{git} #{d}");
	else
		system("cd #{d};git pull");
	end
end


