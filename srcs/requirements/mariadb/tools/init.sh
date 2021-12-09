#!bin/bash

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;"
# admin user
mysql -e "CREATE USER '$USER1'@'%' IDENTIFIED BY '$USER1_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$USER1'@'%';"
# wordpress user
mysql -e "CREATE USER '$USER2'@'%' IDENTIFIED BY '$USER2_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER2'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# mysqld_safe
/bin/bash
# forground로 실행???
