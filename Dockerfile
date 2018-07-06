FROM wordpress:latest
RUN pecl install redis && \
  docker-php-ext-enable redis

ADD redis.awk .
RUN awk -f redis.awk /usr/local/bin/docker-entrypoint.sh > /usr/local/bin/docker-entrypoint.sh.new && \
	mv /usr/local/bin/docker-entrypoint.sh.new /usr/local/bin/docker-entrypoint.sh && \
	chmod +x /usr/local/bin/docker-entrypoint.sh && \
	rm -f redis.awk
