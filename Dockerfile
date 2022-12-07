FROM ubuntu/apache2:2.4-20.04_edge

ENV NODE_ENV=production

RUN apt clean
RUN apt-get update && \
    apt-get install -y software-properties-common ca-certificates lsb-release apt-transport-https curl
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y \
    php7.1 \
    php7.1-cli \
    php7.1-common \
    php7.1-json \
    php7.1-xml \
    php7.1-curl \
    php7.1-opcache \
    php7.1-mysql \
    php7.1-mbstring \
    php7.1-mcrypt \
    php7.1-zip \
    php7.1-fpm \
    php7.1-gd \
    libapache2-mod-php7.1

RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \
    php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs
