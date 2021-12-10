#!bin/bash

# wordpress
wget -c https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv /wordpress/* /var/www/html/
mv /tmp/wp-config.php /var/www/html/
rm -rf latest.tar.gz && /wordpress

# install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# install wordpress
wp core install --allow-root --url='jinbe.42.fr' --title='WordPress for Inception' --admin_user=$DB_USER\
 --admin_password=$DB_USER_PASS --admin_email="jin@student.42seoul.kr" --path='/var/www/html';

# create user
wp user create --allow-root $WP_USER1 jinbe@student.42seoul.kr --user_pass=$WP_USER1_PASS --role=administrator --path=/var/www/html
wp user create --allow-root $WP_USER2 jinbekim@student.42seoul.kr --user_pass=$WP_USER2_PASS --role=author --path=/var/www/html

chown -R www-data:www-data /var/www/html

php-fpm7.3 --nodaemonize
