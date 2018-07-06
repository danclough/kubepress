/^exec \"\$@\"/ {
	print "file_env \"REDIS_HOST\" \"redis:6379\""
	print "file_env \"REDIS_PASSWORD\" \"\""
	print "echo \"session.save_handler = redis\" > /usr/local/etc/php/conf.d/redis-session.ini"
	print "echo \"session.save_path = \\\"tcp://$REDIS_HOST?auth=$REDIS_PASSWORD\\\"\" >> /usr/local/etc/php/conf.d/redis-session.ini"
	print ""
}1
