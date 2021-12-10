#!bin/bash


# wordpress
wget -c https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv /wordpress/* /var/www/html/
mv /tmp/wp-config.php /var/www/html/
rm -rf latest.tar.gz

chown -R www-data:www-data /var/www/html

php-fpm7.3 --nodaemonize
