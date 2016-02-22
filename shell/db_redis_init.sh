#!/bin/bash
# init db_redis host 
# create by yonh
# 2016-02-17 14:50:09

# Defining functions =================

## generate password
gen_pass() {
    MATRIX='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    LENGTH=10
    while [ ${n:=1} -le $LENGTH ]; do
        PASS="$PASS${MATRIX:$(($RANDOM%${#MATRIX})):1}"
        let n+=1
    done
    echo $PASS
}

# Defning return code check function
check_result() {
    if [ $1 -ne 0 ]; then
        echo "Error: $2"
        exit $1
    fi
}

mysqlpassword=$(gen_pass)
redispassword=$(gen_pass)

# Defining functions  ============== end

apt-get update
#apt-get -y upgrade
#check_result $? 'apt-get upgrade failed'

# install mysql-server ============= start
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $mysqlpassword"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $mysqlpassword"
sudo apt-get -y install mysql-server
# set charset
sed -i '/\[mysqld\]/acharacter-set-server=utf8' /etc/mysql/my.cnf
sed -i '/\[client\]/adefault-character-set=utf8' /etc/mysql/my.cnf

sed -i "/^bind-address[ \t]*= 127.0.0.1/s/^/#/" /etc/mysql/my.cnf
service mysql-server restart
# install mysql-server ============= end 

# install redis ==================== start
apt-get -y install redis-server
sed -i "s/# requirepass .*/requirepass $redispassword/g" /etc/redis/redis.conf | grep requirepass
#sed -i 's/port 6379/port 5432/g' /etc/redis/redis.conf # replace redis prot
service redis-server restart
# install redis ==================== end



# install done, print all message
echo "====================================="
echo "mysql account/password:"
echo "root / $mysqlpassword" 
echo "redis requirepassword : $redispassword" 
