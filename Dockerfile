FROM ubuntu/apache2:latest

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    sed -i 's/[[:space:]]*$//' /etc/apt/sources.list && \
    #add-apt-repository ppa:ondrej/apache2 && \
    apt-get update && \
    apt-get install -y \
    libapache2-mod-php7.1 \
    curl \
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
    php7.1-gd

RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \
    php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs