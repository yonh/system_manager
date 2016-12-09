for i in `ls|grep -v docker_load.sh `
do
	docker load < $i
done
