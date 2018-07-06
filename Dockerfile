FROM wordpress:latest
RUN pecl install redis && \
  docker-php-ext-enable redis
  
# Set Redis session handling options in php conf.d
RUN { \
	echo 'session.save_handler = redis'; \
	echo 'session.save_path = "tcp://REDIS_HOST_HERE:6379?auth=REDIS_PASSWORD_HERE"'; \
} > /usr/local/etc/php/conf.d/redis-session.ini

ADD redis.awk .
RUN awk -f redis.awk /usr/local/bin/docker-entrypoint.sh > /usr/local/bin/docker-entrypoint.sh.new && \
	mv /usr/local/bin/docker-entrypoint.sh.new /usr/local/bin/docker-entrypoint.sh && \
	rm -f redis.awk
