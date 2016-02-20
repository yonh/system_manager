# init nginx php5 host 
# create by yonh
# 2016-02-20

# Defining functions =================

## generate password
# Defining functions  ============== end
apt-get update
#apt-get -y upgrade
#check_result $? 'apt-get upgrade failed'

# install 
apt-get install -y nginx php5-fpm php5-gd php5-curl php5-gd php5-mysql

cp nginx/default /etc/nginx/sites-available/default
sed -i 's/listen = \/var\/run\/php5-fpm\.sock/listen = 127\.0\.0\.1:9000/g' /etc/php5/fpm/pool.d/www.conf


service nginx restart
service php5-fpm restart

# install mysql-server ============= start
#sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password $mysqlpassword'
#sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password $mysqlpassword'
#sudo apt-get -y install mysql-server
# set charset
#sed -i '/\[mysqld\]/acharacter-set-server=utf8' /etc/mysql/my.cnf
#sed -i '/\[client\]/adefault-character-set=utf8' /etc/mysql/my.cnf

#sed -i "/^bind-address[ \t]*= 127.0.0.1/s/^/#/" /etc/mysql/my.cnf
#sed -i "/^bind-address[ \t]*= 127.0.0.1/s/^/#/" /etc/mysql/my.cnf
#service mysql-server restart
# install mysql-server ============= end 

# install redis ==================== start
#apt-get -y install redis-server
#sed -i '/# requirepass/requirepass $redispassword' /etc/redis/redis.conf
#sed -i 's/port 6379/port 5432/g' /etc/redis/redis.conf # replace redis prot
#service redis-server restart
# install redis ==================== end



# install done, print all message
#echo "====================================="
#echo "mysql account/password:"
#echo "root / $mysqlpassword" 
#echo "redis requirepassword : $redispassword" 
