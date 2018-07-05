# kubepress
A Kubernetes-friendly Wordpress container featuring Redis PHP session handling.

This Docker image extends the [official Docker Wordpress image](https://hub.docker.com/_/wordpress/) image by adding functionality to store PHP sessions in Redis.

## Getting Started
In your Kubernetes deployment or Docker Compose file, define two environment variables on this container:

- `REDIS_HOST=...` (the hostname and port of your Redis server)
- `REDIS_PASSWORD=...` (the password used to authenticate to the Redis server)

Because distributed Wordpress instances need access to a common set of media files, you must also create a volume for `/var/www/html/wp-content` to ensure that any site-specific content is accessible from any Wordpress container.
