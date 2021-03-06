FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# Update everything first:
RUN apt-get update -y && apt-get upgrade -y --fix-missing

# Install essentials:
RUN apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    git \
    openssl \
    libcurl4-openssl-dev \
    nano \
    lnav \
    ca-certificates\
    composer \
    mysql-client \
    iputils-ping \
    locales \
    gnupg2

# Install everything else:
RUN apt-get install -yq --no-install-recommends \
    graphicsmagick \
    imagemagick \
    ghostscript \
    sqlite3 \
    apache2 \
    libapache2-mod-php7.2 \
    php7.2-cli \
    php7.2-json \
    php7.2-curl \
    php7.2-fpm \
    php7.2-gd \
    php7.2-ldap \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-soap \
    php7.2-sqlite3 \
    php7.2-xml \
    php7.2-xmlrpc \
    php7.2-zip \
    php7.2-intl \
    php-imagick \
    # Install other common mods
    php7.2-opcache \
    php-memcache \
    php-mongodb \
    php7.2-odbc \
    php-fpdf \
    php7.2-pgsql \
    php7.2-pspell \
    php7.2-recode \
    php-redis \
    php7.2-tidy \
    php-uploadprogress \
    php7.2-xsl \
    php-db \
    php7.2-sybase \
    php7.2-gmp \
    # Install subversion and friends
    libsvn-dev \
    subversion \
    subversion-tools \
    libapache2-mod-svn
    
# Generate/Install SSL Certificates:
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/web-php7-apache.key -out /etc/ssl/certs/web-php7-apache.crt -subj "/C=US/ST=Kansas/L=Lenexa/O=Web Development/OU=Web Development/CN=localhost"

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt install -yq --no-install-recommends nodejs

# Install Angular CLI
RUN npm install -g @angular/cli

# Set locales
RUN locale-gen en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8 es_ES.UTF-8 fr_FR.UTF-8 it_IT.UTF-8 km_KH sv_SE.UTF-8 fi_FI.UTF-8

# Enable apache mods
RUN a2enmod rewrite expires ssl authz_groupfile include headers actions unique_id remoteip 

# Clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 80 443 4200
    
CMD ["apache2ctl", "-D", "FOREGROUND"]
