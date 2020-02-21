FROM php:7.3-apache
#volume
VOLUME ["/root/.composer/cache"]

#add scripts
COPY ./scripts /scripts
RUN chmod +x /scripts/*.sh

#server setup
RUN /scripts/install-packages.sh
RUN /scripts/install-apache.sh
RUN /scripts/install-composer.sh

#install craft
RUN rm -vRf /var/www/* && composer -vvv create-project craftcms/craft /var/www ; exit 0
RUN php /scripts/update-composer-json.php
RUN composer clearcache
RUN chmod a+rwx -R /var/www/config
RUN chmod a+rwx -R /var/www/storage
RUN chmod a+rwx -R /var/www/web/cpresources

EXPOSE 80

#run
WORKDIR /var/www
CMD ["/scripts/run.sh"]