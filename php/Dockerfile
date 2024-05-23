ARG COMPOSER_VERSION=latest
ARG PHP_VERSION=latest
FROM composer:${COMPOSER_VERSION} AS composer
FROM php:${PHP_VERSION}

RUN apt-get update \
    && apt-get install --assume-yes \
        sudo \
        libzip-dev \
        zip \
    && docker-php-ext-install -j "$(nproc --all)" \
        pdo_mysql \
        exif \
        zip \
    # create a user
    && groupadd --gid 1000 appgroup \
    && adduser \
        --uid 1000 \
        --gid 1000 \
        --disabled-password \
        --shell /bin/bash \
        --gecos "appuser" \
        appuser \
    && usermod -aG sudo appuser \
    && echo "appuser ALL=NOPASSWD:ALL" >> /etc/sudoers \
    # cleanup
    && rm -rf /var/www/* \
    && apt-get autoremove --assume-yes \
    && apt-get clean --assume-yes \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

WORKDIR /var/www

COPY ./files /
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

USER appuser

CMD ["docker-cmd.sh"]
