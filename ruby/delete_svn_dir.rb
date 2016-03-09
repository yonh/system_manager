#!/usr/bin/ruby

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
