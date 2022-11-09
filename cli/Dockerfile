ARG PHP_VERSION=7.4
FROM php:${PHP_VERSION}-cli

ENV DEBIAN_FRONTEND noninteractive
ENV PROJECT_ROOT /var/www/app
ENV PROJECT_WEBROOT /var/www/app/public
ENV PROJECT_BINARIES /var/www/app/bin
ENV APP_ENV prod
ENV APP_DEBUG 0
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PROJECT_BINARIES

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apt-get -yqq update && apt-get -yqq install git

# Install basic php extensions
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install pdo_mysql

RUN mkdir -p $PROJECT_ROOT && rm -rf /var/www/html

WORKDIR $PROJECT_ROOT

CMD ["console"]
