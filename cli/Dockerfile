ARG PHP_VERSION=7.4
FROM php:${PHP_VERSION}-cli

ENV DEBIAN_FRONTEND noninteractive
ENV PROJECT_ROOT /var/www/app
ENV PROJECT_WEBROOT /var/www/app/public
ENV PROJECT_BINARIES /var/www/app/bin
ENV APP_ENV prod
ENV APP_DEBUG 0
ENV PATH /usr/local/bin:/usr/bin:/bin:$PROJECT_BINARIES

RUN mkdir -p $PROJECT_ROOT && rm -rf /var/www/html

WORKDIR $PROJECT_ROOT
