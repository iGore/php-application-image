ARG PHP_VERSION=8.2
FROM php:${PHP_VERSION}-fpm

ENV DEBIAN_FRONTEND noninteractive
ENV PROJECT_ROOT /var/www/app
ENV PROJECT_WEBROOT /var/www/app/public
ENV PROJECT_BINARIES /var/www/app/bin
ENV APP_ENV prod
ENV APP_DEBUG 0
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PROJECT_BINARIES

RUN apt-get -yqq update && apt-get -yqq install nginx supervisor && mkdir -p $PROJECT_ROOT && rm -rf /var/www/html

RUN apt-get -yqq update && apt-get -yqq install git

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Install basic php extensions
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install pdo_mysql

# configure php to run as root and use production config
RUN sed -i -e 's/user = www-data/user = root/g' /usr/local/etc/php-fpm.d/www.conf \
 && sed -i -e 's/group = www-data/user = root/g' /usr/local/etc/php-fpm.d/www.conf \
 && mv -f /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

# configure nginx to run as root and use default symfony vhosts
COPY virtual_host.conf /etc/nginx/sites-enabled/default
RUN sed -i -e 's/user www-data;/user root root;/g' /etc/nginx/nginx.conf

# setup supervisor to start both php and nginx on runtime
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# new entrypoint does the container provisioning and starts supervisord on container startup
COPY stopchecks /usr/local/bin/stopchecks
COPY stopcheck /usr/local/bin/stopcheck
COPY provisioners /usr/local/bin/provisioners
COPY entrypoint /usr/local/bin/entrypoint
COPY entrypoint_status /usr/local/bin/entrypoint_status
RUN chmod -R +x /usr/local/bin/provisioners /usr/local/bin/stopchecks /usr/local/bin/stopcheck /usr/local/bin/entrypoint /usr/local/bin/entrypoint_status

ENTRYPOINT /usr/local/bin/entrypoint
HEALTHCHECK --start-period=1m --interval=30s --timeout=1s --retries=3 CMD /usr/local/bin/entrypoint_status >> /dev/null

WORKDIR $PROJECT_ROOT

CMD ["bash"]
