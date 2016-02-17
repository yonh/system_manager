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
    echo "$PASS"
}

# Defning return code check function
check_result() {
    if [ $1 -ne 0 ]; then
        echo "Error: $2"
        exit $1
    fi
}

# Defining functions  ============== end

apt-get update
apt-get -y upgrade
check_result $? 'apt-get upgrade failed'

# install mysql-server ============= start
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password Kaki0108@mysql'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password Kaki0108@mysql'
sudo apt-get -y install mysql-server
# set charset
sed -i '/\[mysqld\]/acharacter-set-server=utf8' /etc/mysql/my.cnf
sed -i '/\[client\]/adefault-character-set=utf8' /etc/mysql/my.cnf

sed -i "/^bind-address[ \t]*= 127.0.0.1/s/^/#/" /etc/mysql/my.cnf
# install mysql-server ============= end 

