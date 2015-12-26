FROM php:fpm

# Install PHP modules
RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libpng12-dev \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# Caddyfile
ADD Caddyfile /Caddyfile

# CMD script
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Caddy executable
ADD https://caddyserver.com/download/linux64 /caddy.tgz
RUN tar -xzf /caddy.tgz
RUN mv caddy /bin/caddy
RUN rm /caddy.tgz
RUN chmod +x /bin/caddy

# Volume
VOLUME ["/caddy_working_dir"]

# Some sample php info file
RUN echo "<?php phpinfo(); ?>" > info.php

EXPOSE 80 443

CMD /entrypoint.sh
