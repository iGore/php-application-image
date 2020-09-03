FROM php:7.4-fpm

ENV DEBIAN_FRONTEND noninteractive
ENV PROJECT_ROOT /var/www/app
ENV PROJECT_WEBROOT /var/www/app/public
ENV PROJECT_BINARIES /var/www/app/bin
ENV APP_ENV prod
ENV APP_DEBUG 0

RUN apt-get -yqq update && apt-get -yqq install nginx supervisor && mkdir -p $PROJECT_ROOT && rm -rf /var/www/html

# Let users run symfony executables from everywhere
RUN echo "export PATH=$PATH:$PROJECT_BINARIES" >> ~/.bashrc

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
COPY provisioners /usr/local/bin/provisioners
COPY entrypoint_status.sh /usr/local/bin/entrypoint_status.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod -R +x /usr/local/bin/provisioners /usr/local/bin/entrypoint.sh /usr/local/bin/entrypoint_status

ENTRYPOINT /usr/local/bin/entrypoint.sh

WORKDIR $PROJECT_ROOT
