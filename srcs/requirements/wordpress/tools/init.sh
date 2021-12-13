#!bin/bash

# To avoid volume conflicts
mv /wordpress/* /var/www/html/ && rm -rf /wordpress
chown -R www-data:www-data /var/www/html

# install wordpress
until wp core install --allow-root --url='jinbe.42.fr' --title='WordPress for Inception' --admin_user=$WP_USER1\
 --admin_password=$WP_USER1_PW --admin_email="jin@student.42seoul.kr" --path='/var/www/html'; do
 echo "##### WordPress is unavailable - sleeping"
 sleep 1
 done

# create user2
wp user create --allow-root $WP_USER2 jinbekim@student.42seoul.kr --user_pass=$WP_USER2_PW --role=author --path=/var/www/html

php-fpm7.3 --nodaemonize
