ARG IMAGE="php:7.4-apache"
FROM $IMAGE

#add scripts
COPY ./scripts /scripts
RUN chmod +x /scripts/*.sh

#server setup
RUN /scripts/install-packages.sh && \
    /scripts/install-apache.sh && \
    /scripts/install-composer.sh

COPY .build /var/www

#install craft
RUN chmod a+rwx -R /var/www/config && \
    chmod a+rwx -R /var/www/storage && \
    chmod a+rwx -R /var/www/web/cpresources && \
    chmod a+rwx -R /var/www/.env && \
    chmod a+rwx -R /var/www/composer.*

#cleanup
RUN mkdir /plugin && \
    php /scripts/update-composer-json.php && \
    rm -Rf /scripts

EXPOSE 80
WORKDIR /var/www