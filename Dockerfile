FROM wordpress:latest
RUN pecl install redis && \
  docker-php-ext-enable redis
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
