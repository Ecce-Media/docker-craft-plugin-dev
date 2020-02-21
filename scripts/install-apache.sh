#!/bin/sh

sed -ri -e 's!/var/www/html!/var/www/web!g' /etc/apache2/sites-available/*.conf
a2enmod rewrite

docker-php-ext-configure gd --with-png-dir=/usr/lib/ --with-jpeg-dir=/usr/lib/ --with-gd
docker-php-ext-install pdo_mysql
docker-php-ext-install gd
docker-php-ext-install zip
docker-php-ext-install fileinfo
docker-php-ext-enable imagick

touch /usr/local/etc/php/conf.d/uploads.ini
echo "upload_max_filesize = 100M;" >> /usr/local/etc/php/conf.d/uploads.ini
echo "post_max_size = 200M;" >> /usr/local/etc/php/conf.d/uploads.ini
