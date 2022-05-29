ARG PHP_VERSION=8.1

FROM patricksiemen/php-nginx-symfony:web-${PHP_VERSION}

ENV APP_ENV dev
ENV APP_DEBUG 1

RUN mv -f /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

RUN apt-get -yqq update && apt-get -yqq install wget vim

RUN pecl install xdebug && docker-php-ext-enable xdebug

COPY php-xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
