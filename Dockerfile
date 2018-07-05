FROM wordpress:latest
RUN pecl install redis && \
  docker-php-ext-enable redis && \
  
# Set Redis session handling options in php conf.d
RUN { \
		echo 'session.save_handler = redis'; \
    echo 'session.save_path = "tcp://REDIS_HOST_HERE:6379?auth=REDIS_PASSWORD_HERE"'; \
} > /usr/local/etc/php/conf.d/redis-session.ini
