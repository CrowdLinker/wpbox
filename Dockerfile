FROM wordpress:php7.3-apache

LABEL maintainer="dev@crowdlinker.com"

# Remove debconf errors
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

# Install defaults
RUN apt-get update && \
  apt-get install -y --no-install-recommends --no-install-suggests \
  zip \
  nano \
  unzip \
  gettext \
  apt-utils \
  libssl-dev \
  zlib1g-dev \
  libpng-dev \
  libjpeg-dev \
  libwebp-dev \
  libxml2-dev \
  libmcrypt-dev \
  build-essential \
  ca-certificates \
  libfreetype6-dev \
  libmagickwand-dev \
  apt-transport-https \
  software-properties-common

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
  php wp-cli.phar --info && \
  chmod +x wp-cli.phar && \
  mv wp-cli.phar /usr/local/bin/wp

# Add colors to bash commands
COPY .docker-prompt /etc/.docker-prompt
RUN echo '. /etc/.docker-prompt' >> /etc/bash.bashrc\
  && echo '. /etc/.docker-prompt' >> /root/.bashrc

# Expose port
EXPOSE 80
