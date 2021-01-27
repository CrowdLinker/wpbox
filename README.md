# WPBox (Docker)

## Overview

Docker image that can be used to run Wordpress apps.

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

### Important Information

1. `./docker-prompt` is used for adding colors to docker shell

### Contributors

- Team @Crowdlinker ([Github](https://github.com/CrowdLinker) | [Bitbucket](https://bitbucket.org/crowdlinker/))
