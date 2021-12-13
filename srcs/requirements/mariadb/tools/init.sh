#!bin/bash

#Start MariaDB
service mysql start
#Create database
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;"
echo "####Database $DB_NAME created"
#Create user
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PW';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
echo "####User $DB_USER created"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PW'; FLUSH PRIVILEGES;"
echo "####Root password changed"
mysqladmin -uroot -p$DB_ROOT_PW shutdown
#End MariaDB

#daemon
exec mysqld_safe
