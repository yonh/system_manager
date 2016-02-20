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

