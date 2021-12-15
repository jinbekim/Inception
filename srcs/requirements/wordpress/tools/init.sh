#!bin/bash

# if empty
if [ ! -e /var/www/html/wp-config.php ]; then
	# wordpress
	wget -c https://wordpress.org/latest.tar.gz
	tar -xvf latest.tar.gz
	mv /tmp/wp-config.php /wordpress/
	mv /wordpress/* /var/www/html/
	chown -R www-data:www-data /var/www/html
	rm -rf latest.tar.gz /wordpress

	# install wordpress
	until wp core install --allow-root --url=$DOMAIN_NAME --title='WordPress for Inception' --admin_user=$WP_USER1\
	--admin_password=$WP_USER1_PW --admin_email="jin@student.42seoul.kr" --path='/var/www/html'; do
	echo "##### WordPress is unavailable - sleeping"
	sleep 1
	done

	# create user2
	wp user create --allow-root $WP_USER2 jinbekim@student.42seoul.kr --user_pass=$WP_USER2_PW --role=author --path=/var/www/html
fi

service sendmail start
php-fpm7.3 --nodaemonize
