#!/usr/bin/ruby

require 'find'

#default current dir

dir = "."

count = 0

Find.find(dir) do |path|
  if File.directory?(path) and File.basename(path) == '.svn'
        FileUtils.rm_r path
        count = +1
  end
end

puts "info: success remove #{count} dir"

exit
File.open("a.svn", "r") do |f|
	while s = f.gets do
		s = s.rstrip
		index = s.index(".svn")
		if index then
			svndir = s[0,index+4]
		end
		if svndir and File.directory?(svndir) then
			system("git rm -rf #{svndir}")
			sleep(1)
		end
	end
end
