# WPBox (Docker)

## Overview

Docker image that can be used to run Wordpress apps.

## Versions Available

Apache - [latest](https://hub.docker.com/repository/docker/crowdlinker/wpbox/tags?page=1&ordering=last_updated&name=latest), [5.5.1-php7.4-apache](https://hub.docker.com/repository/docker/crowdlinker/wpbox/tags?page=1&ordering=last_updated&name=5.5.1-php7.4-apache), [5.6-php7.4-apache](https://hub.docker.com/repository/docker/crowdlinker/wpbox/tags?page=1&ordering=last_updated&name=5.6-php7.4-apache)

## Installation

Replace `$APP_NAME` to your app's name (snake_case).

```yaml
version: "3.1"

services:
  ${APP_NAME}_wordpress:
    container_name: ${APP_NAME}_wordpress
    restart: always
    image: crowdlinker/wpbox
    ports:
      - "80:80"
    working_dir: /var/www/html
    volumes:
      - ./:/var/www/html/wp-content/themes/${APP_NAME}-wordpress
      - ../plugins:/var/www/html/wp-content/plugins
      - ../uploads:/var/www/html/wp-content/uploads
      - wordpress:/var/www/html
    environment:
      - WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
      - WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
      - WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
      - WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
      - WORDPRESS_CONFIG_EXTRA=

        define('WP_HOME', 'http://${APP_NAME}.test');

        define('WP_SITEURL', 'http://${APP_NAME}.test');

volumes:
  ${APP_NAME}_wordpress:

networks:
  default:
    external:
      name: ${APP_NAME}
```

## Different Wordpress Version

### Using Dockerfile

```bash
$ git clone https://github.com/CrowdLinker/wpbox wpbox
$ cd wpbox
$ docker build -t wpbox --build-arg WORDPRESS_IMAGE=wordpress:5.5.1-php7.4-apache .
```

### Using Docker-Compose.yml

```yaml
services:
  ${APP_NAME}_wordpress:
    image: crowdlinker/wpbox:5.5.1-php7.4-apache
```

### From Inside The Container

```bash
$ docker exec -it ${APP_NAME}_wordpress bash
$ wp core update --version=5.5.1
```

## Important Information

1. `./docker-prompt` is used for adding colors to docker shell

## Contributors

- Team @Crowdlinker ([Github](https://github.com/CrowdLinker) | [Bitbucket](https://bitbucket.org/crowdlinker/))
